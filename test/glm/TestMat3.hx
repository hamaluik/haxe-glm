package glm;

import buddy.*;
import glm.Mat3;
using buddy.Should;

class TestMat3 extends BuddySuite {
	public function new() {
		describe('Using Mat3', {
			var ma:Mat3;
			before({
				ma = new Mat3();
			});

			it('should be able to clone itself', {
				ma = Mat3.fromRows(
					new Vec3(1, 2, 3),
					new Vec3(4, 5, 6),
					new Vec3(7, 8, 9)
				);
				var mb:Mat3 = ma.clone();
				for(i in 0...3) {
					for(j in 0...3) {
						mb[i][j].should.beCloseTo(ma[i][j]);
					}
				}
				ma[0][0] = 7;
				mb[0][0].should.beCloseTo(1);
			});
			it('should be able to create a zero matrix', {
				ma = Mat3.zero();
				for(i in 0...3) {
					for(j in 0...3) {
						ma[i][j].should.beCloseTo(0);
					}
				}
			});
			it('should be able to create an identity matrix', {
				ma = Mat3.identity();
				for(i in 0...3) {
					for(j in 0...3) {
						ma[i][j].should.beCloseTo(i == j ? 1 : 0);
					}
				}
			});
			it('should allow array access', {
				ma = new Mat3(4.2);
				ma[0][0].should.beCloseTo(4.2);
			});
			it('should be able to multliply vec3s with itself', {
				ma = Mat3.fromRows(
					new Vec3(1, 2, 3),
					new Vec3(4, 5, 6),
					new Vec3(7, 8, 9)
				);
				var r:Vec3 = ma * new Vec3(1, 1, 1);
				r[0].should.beCloseTo(6);
				r[1].should.beCloseTo(15);
				r[2].should.beCloseTo(24);
			});
			it('should be able to multliply mat4s with itself', {
				ma = Mat3.fromRows(
					new Vec3(1, 2, 3),
					new Vec3(4, 5, 6),
					new Vec3(7, 8, 9)
				);
				var mb:Mat3 = Mat3.fromRows(
					new Vec3(7, 8, 9),
					new Vec3(4, 5, 6),
					new Vec3(1, 2, 3)
				);
				var mc = ma * mb;
				var values:Array<Float> = [18, 24, 30, 54, 69, 84, 90, 114, 138];
				for(i in 0...3) {
					for(j in 0...3) {
						mc[i][j].should.beCloseTo(values[(i * 3) + j]);
					}
				}
			});
			it('should flatten into row-major order', {
				ma = Mat3.fromRows(
					new Vec3(1, 2, 3),
					new Vec3(4, 5, 6),
					new Vec3(7, 8, 9)
				);
				var actual:Array<Float> = ma.toArrayRowMajor();
				var expected:Array<Float> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
				for(i in 0...9) {
					actual[i].should.beCloseTo(expected[i]);
				}
			});
			it('should flatten into column-major order', {
				ma = Mat3.fromRows(
					new Vec3(1, 2, 3),
					new Vec3(4, 5, 6),
					new Vec3(7, 8, 9)
				);
				var actual:Array<Float> = ma.toArrayColMajor();
				var expected:Array<Float> = [1, 4, 7, 2, 5, 8, 3, 6, 9];
				for(i in 0...9) {
					actual[i].should.beCloseTo(expected[i]);
				}
			});
			it('should be serializable', {
				ma = Mat3.fromRowArray([
					new Vec3(1, 2, 3),
					new Vec3(4, 5, 6),
					new Vec3(7, 8, 9)
				]);

				var s:haxe.Serializer = new haxe.Serializer();
				s.serialize(ma);
				var serialized:String = s.toString();

				var u:haxe.Unserializer = new haxe.Unserializer(serialized);
				var mb:Mat3 = u.unserialize();
				
				for(i in 0...3) {
					for(j in 0...3) {
						mb[i][j].should.beCloseTo(ma[i][j]);
					}
				}
			});
			it('should calculate its transpose', {
				ma = Mat3.fromRows(
					new Vec3(1, 2, 3),
					new Vec3(4, 5, 6),
					new Vec3(7, 8, 9)
				);
				var mb:Mat3 = ma.clone().transpose();
				for(i in 0...3) {
					for(j in 0...3) {
						mb[i][j].should.beCloseTo(ma[j][i]);
					}
				}
			});
			it('should calculate its inverse', {
				ma = Mat3.fromRows(
					new Vec3(1, 2, 3),
					new Vec3(0, 4, 5),
					new Vec3(0, 0, 6)
				);
				ma.invert();
				var expected:Mat3 = Mat3.fromRows(
					new Vec3(1.0000, -0.5000, -0.0833),
					new Vec3(     0,  0.2500, -0.2083),
					new Vec3(     0,       0,  0.1667)
				);
				for(i in 0...3) {
					for(j in 0...3) {
						ma[i][j].should.beCloseTo(expected[i][j]);
					}
				}});
			it('should calculate its determinant', {
				ma = Mat3.fromRows(
					new Vec3(1, 2, 3),
					new Vec3(0, 4, 5),
					new Vec3(0, 0, 6)
				);
				ma.determinant().should.beCloseTo(24);
			});

			after({
				ma = null;
			});
		});
	}
}