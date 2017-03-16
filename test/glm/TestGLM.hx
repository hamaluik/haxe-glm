package glm;

import buddy.*;
import glm.GLM;
using buddy.Should;

class TestGLM extends BuddySuite {
	public function new() {
		describe('Using GLM', {
			it('should be able to apply translation matrices to mat4s', {
				var v:Vec3 = new Vec3(0, 0, 0);
				var v2:Vec3 = GLM.translate(new Vec3(1, 2, 3)) * v;
				v2.x.should.beCloseTo(1);
				v2.y.should.beCloseTo(2);
				v2.z.should.beCloseTo(3);
				var v3:Vec3 = GLM.translate(new Vec2(-2, 2)) * v2;
				v3.x.should.beCloseTo(-1);
				v3.y.should.beCloseTo(4);
				v3.z.should.beCloseTo(3);
			});
			it('should be able to apply rotations to Vec3s', {
				var r:Vec3 = GLM.rotate(GLM.axisAngle(new Vec3(1, 0, 0), Math.PI / 2), new Vec3(0, 1, 0));
				r.x.should.beCloseTo(0);
				r.y.should.beCloseTo(0);
				r.z.should.beCloseTo(1);

				r = GLM.rotate(GLM.axisAngle(new Vec3(1, 0, 0), -Math.PI / 2), new Vec3(0, 1, 0));
				r.x.should.beCloseTo(0);
				r.y.should.beCloseTo(0);
				r.z.should.beCloseTo(-1);

				r = GLM.rotate(GLM.axisAngle(new Vec3(0, 1, 0), Math.PI / 2), new Vec3(1, 0, 0));
				r.x.should.beCloseTo(0);
				r.y.should.beCloseTo(0);
				r.z.should.beCloseTo(-1);
			});
			it('should be able to apply scale matrices to mat4s', {
				var v:Vec3 = new Vec3(0, 0, 0);
				var v2:Vec3 = GLM.scale(new Vec3(1, 2, 3)) * v;
				v2.x.should.beCloseTo(0);
				v2.y.should.beCloseTo(0);
				v2.z.should.beCloseTo(0);
				var v3:Vec3 = GLM.scale(new Vec3(4, 2, 5)) * new Vec3(1, 1, 1);
				v3.x.should.beCloseTo(4);
				v3.y.should.beCloseTo(2);
				v3.z.should.beCloseTo(5);
			});
		});
	}
}