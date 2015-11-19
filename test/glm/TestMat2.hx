package glm;

import buddy.*;
import glm.Mat2;
using buddy.Should;

class TestMat2 extends BuddySuite {
	public function new() {
		describe('Using Mat2', {
			var ma:Mat2;
			before({
				ma = new Mat2();
			});

			it('should be able to clone itself', {
				ma = Mat2.fromRows(
					new Vec2(1, 2),
					new Vec2(3, 4)
				);
				var mb:Mat2 = ma.clone();
				for(i in 0...2) {
					for(j in 0...2) {
						mb[i][j].should.beCloseTo(ma[i][j]);
					}
				}
				ma[0][0] = 7;
				mb[0][0].should.beCloseTo(1);
			});
			it('should be able to create a zero matrix', {
				ma = Mat2.zero();
				for(i in 0...2) {
					for(j in 0...2) {
						ma[i][j].should.beCloseTo(0);
					}
				}
			});
			it('should be able to create an identity matrix', {
				ma = Mat2.identity();
				for(i in 0...2) {
					for(j in 0...2) {
						ma[i][j].should.beCloseTo(i == j ? 1 : 0);
					}
				}
			});
			it('should allow array access', {
				ma = new Mat2(4.2);
				ma[0][0].should.beCloseTo(4.2);
			});
			it('should be able to multliply vec3s with itself', {
				ma = Mat2.fromRows(
					new Vec2(1, 2),
					new Vec2(3, 4)
				);
				var r:Vec2 = ma * new Vec2(1, 1);
				r[0].should.beCloseTo(3);
				r[1].should.beCloseTo(7);
			});
			it('should be able to multliply mat4s with itself', {
				ma = Mat2.fromRows(
					new Vec2(1, 2),
					new Vec2(3, 4)
				);
				var mb:Mat2 = Mat2.fromRows(
					new Vec2(3, 4),
					new Vec2(1, 2)
				);
				var mc = ma * mb;
				var values:Array<Float> = [5, 8, 13, 20];
				for(i in 0...2) {
					for(j in 0...2) {
						mc[i][j].should.beCloseTo(values[(i * 2) + j]);
					}
				}
			});
			it('should flatten into row-major order', {
				ma = Mat2.fromRows(
					new Vec2(1, 2),
					new Vec2(3, 4)
				);
				var actual:Array<Float> = ma.toArrayRowMajor();
				var expected:Array<Float> = [1, 2, 3, 4];
				for(i in 0...4) {
					actual[i].should.beCloseTo(expected[i]);
				}
			});
			it('should flatten into column-major order', {
				ma = Mat2.fromRows(
					new Vec2(1, 2),
					new Vec2(3, 4)
				);
				var actual:Array<Float> = ma.toArrayColMajor();
				var expected:Array<Float> = [1, 3, 2, 4];
				for(i in 0...4) {
					actual[i].should.beCloseTo(expected[i]);
				}
			});
			it('should be serializable', {
				ma = Mat2.fromRowArray([
					new Vec2(1, 2),
					new Vec2(3, 4)
				]);

				var s:haxe.Serializer = new haxe.Serializer();
				s.serialize(ma);
				var serialized:String = s.toString();

				var u:haxe.Unserializer = new haxe.Unserializer(serialized);
				var mb:Mat2 = u.unserialize();
				
				for(i in 0...2) {
					for(j in 0...2) {
						mb[i][j].should.beCloseTo(ma[i][j]);
					}
				}
			});
			it('should calculate its transpose', {
				ma = Mat2.fromRows(
					new Vec2(1, 2),
					new Vec2(0, 3)
				);
				var mb:Mat2 = ma.clone().transpose();
				for(i in 0...2) {
					for(j in 0...2) {
						mb[i][j].should.beCloseTo(ma[j][i]);
					}
				}
			});
			it('should calculate its inverse', {
				ma = Mat2.fromRows(
					new Vec2(1, 2),
					new Vec2(0, 3)
				);
				ma.invert();
				var expected:Mat2 = Mat2.fromRows(
					new Vec2(1.0000, -0.6667),
					new Vec2(     0,  0.3333)
				);
				for(i in 0...2) {
					for(j in 0...2) {
						ma[i][j].should.beCloseTo(expected[i][j]);
					}
				}});
			it('should calculate its determinant', {
				ma = Mat2.fromRows(
					new Vec2(1, 2),
					new Vec2(0, 3)
				);
				ma.determinant().should.beCloseTo(3);
			});

			after({
				ma = null;
			});
		});
	}
}