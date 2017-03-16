package glm;

import buddy.*;
import glm.Vec3;
using buddy.Should;

class TestVec3 extends BuddySuite {
	public function new() {
		describe('Using Vec3s', {
			var v:Vec3;
			beforeEach({
				v = new Vec3(1, 2, 3);
			});

			it("should provide a set function", {
				v.set(0, 5);
				v.set(1, 6);
				v.set(2, 7);

				v.x.should.be(5);
				v.y.should.be(6);
				v.z.should.be(7);
			});

			it("should provide a get function", {
				v.get(0).should.be(1);
				v.get(1).should.be(2);
				v.get(2).should.be(3);
			});

			it("should calculate the length", {
				v.sqrLength.should.beCloseTo(14);
				v.length.should.beCloseTo(3.74165738677);
			});

			it("should add scalars", {
				v.addScalar(1);
				v.x.should.be(2);
				v.y.should.be(3);
				v.z.should.be(4);
			});

			it("should add other vectors", {
				v.addVec3(new Vec3(1, 2, 3));
				v.x.should.be(2);
				v.y.should.be(4);
				v.z.should.be(6);
			});

			it("should subtract scalars", {
				v.subtractScalar(1);
				v.x.should.be(0);
				v.y.should.be(1);
				v.z.should.be(2);
			});

			it("should subtract other vectors", {
				v.subtractVec3(new Vec3(1, 2, 3));
				v.x.should.be(0);
				v.y.should.be(0);
				v.z.should.be(0);
			});

			it("should multiply scalars", {
				v.multiply(3);
				v.x.should.be(3);
				v.y.should.be(6);
				v.z.should.be(9);
			});

			it("should convert to an array", {
				var arr:Array<Float> = v.toArray();
				for(i in 0...3) {
					v.get(i).should.be(arr[i]);
				}
			});

			it("should normalize", {
				v.normalize();
				v.x.should.beCloseTo(0.26726124191);
				v.y.should.beCloseTo(0.53452248382);
				v.z.should.beCloseTo(0.80178372573);
			});

			it("should lerp", {
				var b:Vec3 = v.lerp(new Vec3(2, 3, 4), 0.5);
				b.x.should.beCloseTo(1.5);
				b.y.should.beCloseTo(2.5);
				b.z.should.beCloseTo(3.5);
			});

			it("should dot", {
				var b:Vec3 = v.clone();
				var x:Float = Vec3.dot(v, b);
				x.should.beCloseTo(14);
			});

			afterEach({
				v = null;
			});
		});
	}
}