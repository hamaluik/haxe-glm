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