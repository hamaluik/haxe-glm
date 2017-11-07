package glm;

import buddy.*;
using buddy.Should;

using glm.Vec3;

class TestVec3 extends BuddySuite {
	public function new() {
		describe('Using Vec3s', {
			var va:Vec3, vb:Vec3;

			beforeEach({
				va = new Vec3(1, 2, 3);
				vb = new Vec3(-1, -2, -3);
			});

			it("should provide element access", {
				va[1].should.be(2);
				va.x.should.be(1);
				va.x = 42;
				va[0].should.be(42);
			});

			it("should calculate the magnitude", {
				var m:Float = Math.sqrt(va.x*va.x + va.y*va.y + va.z*va.z);
				va.length().should.beCloseTo(m);
			});

			it("should provide copy support", {
				var vc:Vec3 = va.copy(new Vec3());
				vc.x.should.beCloseTo(va.x);
				vc.y.should.beCloseTo(va.y);
				vc.z.should.beCloseTo(va.z);
			});

			it("should provide vector math", {
				va.addVec(new Vec3(1, 1, 1), vb);
				vb.equals(new Vec3(2, 3, 4)).should.be(true);

				vb.subtractVec(new Vec3(1, 1, 1), vb);
				vb.equals(va).should.be(true);

				var vc:Vec3 = va + new Vec3(1, 1, 1);
				vc.equals(new Vec3(2, 3, 4)).should.be(true);

				vc = va - new Vec3(1, 2, 3);
				vc.equals(new Vec3()).should.be(true);
			});

			it("should provide scalar math", {
				va.addScalar(1, vb);
				vb.equals(new Vec3(2, 3, 4)).should.be(true);
				va.multiplyScalar(0.5, vb);
				vb.equals(new Vec3(0.5, 1, 1.5)).should.be(true);

				var vc:Vec3 = va * 3;
				vc.equals(new Vec3(3, 6, 9)).should.be(true);

				vc = va + 3;
				vc.equals(new Vec3(4, 5, 6)).should.be(true);

				vc = va - 1;
				vc.equals(new Vec3(0, 1, 2)).should.be(true);
			});

			it("should calculate distance between vectors", {
				va.distance(vb).should.beCloseTo(7.4833);
			});

			it("should calculate the dot product", {
				va.dot(vb).should.beCloseTo(-14);
			});

			it("should normalize", {
				var v:Vec3 = va.normalize(new Vec3());
				v.x.should.beCloseTo(0.2673);
				v.y.should.beCloseTo(0.5345);
				v.z.should.beCloseTo(0.8018);
			});

			it("should linearly interpolate", {
				var x:Vec3 = va.lerp(vb, 0.5, new Vec3());
				x.equals(new Vec3()).should.be(true);
			});

			it("provide the cross product", {
				va = new Vec3(1, 0, 0);
				vb = new Vec3(0, 1, 0);
				var vc:Vec3 = va.cross(vb, new Vec3());

				vc.x.should.be(0);
				vc.y.should.be(0);
				vc.z.should.be(1);
			});
		});
	}
}