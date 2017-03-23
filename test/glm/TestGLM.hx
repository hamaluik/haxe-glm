package glm;

import glm.GLM;
import buddy.*;
using buddy.Should;

class TestGLM extends BuddySuite {
	public function new() {
		describe('Using GLM', {
			it("should provide a linear interpolation function", {
                GLM.lerp(0, 4, 0.75).should.beCloseTo(3);
			});

            it("should create translation matrices", {
                var t:Mat4 = GLM.translate(2, 4, 5, new Mat4());
                t.r0c3.should.be(2);
                t.r1c3.should.be(4);
                t.r2c3.should.be(5);
            });

            it("should create rotation matrices from quaternions");

            it("should create rotation matrices from euler angles");

            it("should create rotation matrices about the x axis");

            it("should create rotation matrices about the y axis");

            it("should create rotation matrices about the z axis");

            it("should create scale matrices", {
                var s:Mat4 = GLM.scale(-1, 2, 3, new Mat4());
                s.r0c0.should.be(-1);
                s.r1c1.should.be(2);
                s.r2c2.should.be(3);
            });

            it("should create perspective matrices", {
                var persp:Mat4 = GLM.perspective(45 * Math.PI / 180, 640 / 480, 0.1, 200, new Mat4());
                persp.r0c0.should.beCloseTo(1.81066);
                persp.r1c1.should.beCloseTo(2.414213);
                persp.r2c2.should.beCloseTo(-1.001);
                persp.r2c3.should.beCloseTo(-0.2001);
                persp.r3c2.should.beCloseTo(-1);
                persp.r3c3.should.beCloseTo(0);
            });
            
            it("should create orthogonal matrices", {
                var persp:Mat4 = GLM.orthographic(-1, 1, -1, 1, -1, 1, new Mat4());
                persp.equals(new Mat4(
                    1, 0, 0, 0,
                    0, 1, 0, 0,
                    0, 0, -1, 0,
                    0, 0, 0, 1
                )).should.be(true);
            });

            it("should create frustrum matrices", {
                var persp:Mat4 = GLM.frustum(-1, 1, -1, 1, -1, 1, new Mat4());
                persp.equals(new Mat4(
                    -1, 0, 0, 0,
                    0, -1, 0, 0,
                    0, 0, 0, 1,
                    0, 0, -1, 0
                )).should.be(true);
            });

            it("should create lookat matrices");
		});
	}
}