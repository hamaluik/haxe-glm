package glm;

import buddy.*;
using buddy.Should;

using glm.Vec2;
using glm.Vec3;

class TestVec2 extends BuddySuite {
	public function new() {
		describe('Using Vec2s', {
			var va:Vec2, vb:Vec2;

			beforeEach({
				va = new Vec2(1, 2);
				vb = new Vec2(-1, -2);
			});

			it("should provide element access", {
				va[1].should.be(2);
				va.x.should.be(1);
				va.x = 42;
				va[0].should.be(42);
			});

			it("should calculate the magnitude", {
				var m:Float = Math.sqrt(va.x*va.x + va.y*va.y);
				va.length().should.beCloseTo(m);
			});

			it("should provide copy support", {
				var vc:Vec2 = va.copy(new Vec2());
				vc.x.should.beCloseTo(va.x);
				vc.y.should.beCloseTo(va.y);
			});

			it("should provide vector math", {
				va.addVec(new Vec2(1, 1), vb);
				vb.equals(new Vec2(2, 3)).should.be(true);

				vb.subtractVec(new Vec2(1, 1), vb);
				vb.equals(va).should.be(true);

				var vc:Vec2 = va + new Vec2(1, 1);
				vc.equals(new Vec2(2, 3)).should.be(true);

				vc = va - new Vec2(1, 2);
				vc.equals(new Vec2()).should.be(true);
			});

			it("should provide scalar math", {
				va.addScalar(1, vb);
				vb.equals(new Vec2(2, 3)).should.be(true);
				va.multiplyScalar(0.5, vb);
				vb.equals(new Vec2(0.5, 1)).should.be(true);

				var vc:Vec2 = va * 3;
				vc.equals(new Vec2(3, 6)).should.be(true);

				vc = va + 3;
				vc.equals(new Vec2(4, 5)).should.be(true);

				vc = va - 1;
				vc.equals(new Vec2(0, 1)).should.be(true);
			});

			it("should calculate distance between vectors", {
				va.distance(vb).should.beCloseTo(4.4721);
			});

			it("should calculate the dot product", {
				va.dot(vb).should.beCloseTo(-5);
			});

			it("should normalize", {
				var v:Vec2 = va.normalize(new Vec2());
				v.x.should.beCloseTo(0.4472);
				v.y.should.beCloseTo(0.8944);
			});

			it("should linearly interpolate", {
				var x:Vec2 = va.lerp(vb, 0.5, new Vec2());
				x.equals(new Vec2()).should.be(true);
			});

			it("provide the cross product", {
				va = new Vec2(1, 0);
				vb = new Vec2(0, 1);
				var vc:Vec3 = va.cross(vb, new Vec3());

				vc.x.should.be(0);
				vc.y.should.be(0);
				vc.z.should.be(1);
			});
		});
	}
}