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

			it("should provide element access");

			it("should calculate the magnitude");

			it("should provide copy support");

			it("should provide vector math");

			it("should provide scalar math");

			it("should calculate distance between vectors");

			it("should calculate the dot product");

			it("should normalize");

			it("should linearly interpolate");

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