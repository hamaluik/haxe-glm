package glm;

import buddy.*;
import glm.Vec4;
using buddy.Should;

class TestVec4 extends BuddySuite {
	public function new() {
		describe('Using Vec4s', {
			var v:Vec4;
			beforeEach({
				v = new Vec4(1, 2, 3, 4);
			});

			it("should provide a set function", {
				v.set(0, 5);
				v.set(1, 6);
				v.set(2, 7);
				v.set(3, 8);

				v.x.should.be(5);
				v.y.should.be(6);
				v.z.should.be(7);
				v.w.should.be(8);
			});

			it("should provide a get function", {
				v.get(0).should.be(1);
				v.get(1).should.be(2);
				v.get(2).should.be(3);
				v.get(3).should.be(4);
			});

			it("should calculate the length", {
				v.sqrLength.should.beCloseTo(30);
				v.length.should.beCloseTo(5.47722557505);
			});

			it("should add scalars", {
				v.addScalar(1);
				v.x.should.be(2);
				v.y.should.be(3);
				v.z.should.be(4);
				v.w.should.be(5);
			});

			it("should add other vectors", {
				v.addVec4(new Vec4(1, 2, 3, 4));
				v.x.should.be(2);
				v.y.should.be(4);
				v.z.should.be(6);
				v.w.should.be(8);
			});

			it("should subtract scalars", {
				v.subtractScalar(1);
				v.x.should.be(0);
				v.y.should.be(1);
				v.z.should.be(2);
				v.w.should.be(3);
			});

			it("should subtract other vectors", {
				v.subtractVec4(new Vec4(1, 2, 3, 4));
				v.x.should.be(0);
				v.y.should.be(0);
				v.z.should.be(0);
				v.w.should.be(0);
			});

			it("should multiply scalars", {
				v.multiply(3);
				v.x.should.be(3);
				v.y.should.be(6);
				v.z.should.be(9);
				v.w.should.be(12);
			});

			it("should convert to an array", {
				var arr:Array<Float> = v.toArray();
				for(i in 0...4) {
					v.get(i).should.be(arr[i]);
				}
			});

			it("should normalize", {
				v.normalize();
				v.x.should.beCloseTo(0.18257418583);
				v.y.should.beCloseTo(0.36514837167);
				v.z.should.beCloseTo(0.5477225575);
				v.w.should.beCloseTo(0.73029674334);
			});

			it("should lerp", {
				var b:Vec4 = v.lerp(new Vec4(2, 3, 4, 5), 0.5);
				b.x.should.beCloseTo(1.5);
				b.y.should.beCloseTo(2.5);
				b.z.should.beCloseTo(3.5);
				b.w.should.beCloseTo(4.5);
			});

			it("should dot", {
				var b:Vec4 = v.clone();
				var x:Float = Vec4.dot(v, b);
				x.should.beCloseTo(30);
			});

			afterEach({
				v = null;
			});
		});
	}
}