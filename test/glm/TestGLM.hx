package glm;

import glm.GLM;
import buddy.*;
using buddy.Should;

import glm.Vec3;
import glm.Quat;
import glm.Mat4;

class TestGLM extends BuddySuite {
	public function new() {
		describe('Using GLM', {
			it("should provide a linear interpolation function", {
                GLM.lerp(0, 4, 0.75).should.beCloseTo(3);
			});

            it("should create translation matrices", {
                var t:Mat4 = GLM.translate(new Vec3(2, 4, 5), new Mat4());
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
                var s:Mat4 = GLM.scale(new Vec3(-1, 2, 3), new Mat4());
                s.r0c0.should.be(-1);
                s.r1c1.should.be(2);
                s.r2c2.should.be(3);
            });

            it("should construct complete transformation matrices", {
                var t:Vec3 = new Vec3(-1, 2, 3);
                var r:Quat = Quat.axisAngle(new Vec3(1, 0, 0), Math.PI / 2, new Quat());
                var s:Vec3 = new Vec3(2, 3, 4);

                var transform:Mat4 = GLM.transform(t, r, s, new Mat4());

                var m_t:Mat4 = GLM.translate(t, new Mat4());
                var m_r:Mat4 = GLM.rotate(r, new Mat4());
                var m_s:Mat4 = GLM.scale(s, new Mat4());

                var result:Mat4 = Mat4.multMat(m_r, m_s, new Mat4());
                result = Mat4.multMat(m_t, result, result);

                transform.r0c0.should.beCloseTo(result.r0c0);
                transform.r1c0.should.beCloseTo(result.r1c0);
                transform.r1c0.should.beCloseTo(result.r1c0);
                transform.r1c0.should.beCloseTo(result.r1c0);

                transform.r0c1.should.beCloseTo(result.r0c1);
                transform.r1c1.should.beCloseTo(result.r1c1);
                transform.r1c1.should.beCloseTo(result.r1c1);
                transform.r1c1.should.beCloseTo(result.r1c1);

                transform.r0c2.should.beCloseTo(result.r0c2);
                transform.r1c2.should.beCloseTo(result.r1c2);
                transform.r1c2.should.beCloseTo(result.r1c2);
                transform.r1c2.should.beCloseTo(result.r1c2);

                transform.r0c3.should.beCloseTo(result.r0c3);
                transform.r1c3.should.beCloseTo(result.r1c3);
                transform.r1c3.should.beCloseTo(result.r1c3);
                transform.r1c3.should.beCloseTo(result.r1c3);
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