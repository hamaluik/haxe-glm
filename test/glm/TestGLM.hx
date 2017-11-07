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

			it("should create rotation matrices from quaternions", {
				var r:Quat = Quat.axisAngle(new Vec3(0, 1, 0), -Math.PI / 2, new Quat());
				var r_m:Mat4 = GLM.rotate(r, new Mat4());

				var x:Vec4 = new Vec4(1, 0, 0, 1);
				var z:Vec4 = Mat4.multVec(r_m, x, new Vec4());
				z.x.should.beCloseTo(0);
				z.y.should.beCloseTo(0);
				z.z.should.beCloseTo(1);
				z.w.should.beCloseTo(1);
			});

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
				var r:Float = 3;
				var b:Float = 3 * 9 / 16;
				var l:Float = -r;
				var t:Float = -b;
				var n:Float = -1;
				var f:Float = 1;

				var persp:Mat4 = GLM.orthographic(l, r, b, t, n, f, new Mat4());
				var target:Mat4 = new Mat4(
					1/r, 0, 0, 0,
					0, 1/t, 0, 0,
					0, 0, -2/(f-n), -1*(f+n)/(f-n),
					0, 0, 0, 1
				);

				persp.r0c0.should.beCloseTo(target.r0c0);
				persp.r1c0.should.beCloseTo(target.r1c0);
				persp.r2c0.should.beCloseTo(target.r2c0);
				persp.r3c0.should.beCloseTo(target.r3c0);

				persp.r0c1.should.beCloseTo(target.r0c1);
				persp.r1c1.should.beCloseTo(target.r1c1);
				persp.r2c1.should.beCloseTo(target.r2c1);
				persp.r3c1.should.beCloseTo(target.r3c1);

				persp.r0c2.should.beCloseTo(target.r0c2);
				persp.r1c2.should.beCloseTo(target.r1c2);
				persp.r2c2.should.beCloseTo(target.r2c2);
				persp.r3c2.should.beCloseTo(target.r3c2);

				persp.r0c3.should.beCloseTo(target.r0c3);
				persp.r1c3.should.beCloseTo(target.r1c3);
				persp.r2c3.should.beCloseTo(target.r2c3);
				persp.r3c3.should.beCloseTo(target.r3c3);
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

			it("should create lookat matrices", {
				var eye:Vec3 = new Vec3(-3, 1, 3);
				var centre:Vec3 = new Vec3(0, 0, 0);
				var up:Vec3 = new Vec3(0, 1, 0);
				
				var lookat:Mat4 = GLM.lookAt(eye, centre, up, new Mat4());
				
				lookat.r0c0.should.beCloseTo(-0.70711);
				lookat.r0c1.should.beCloseTo( 0.16222);
				lookat.r0c2.should.beCloseTo( 0.68825);
				lookat.r0c3.should.beCloseTo(-3.00000);
				
				lookat.r1c0.should.beCloseTo( 0.00000);
				lookat.r1c1.should.beCloseTo( 0.97333);
				lookat.r1c2.should.beCloseTo(-0.22942);
				lookat.r1c3.should.beCloseTo( 1.00000);
				
				lookat.r2c0.should.beCloseTo(-0.70711);
				lookat.r2c1.should.beCloseTo(-0.16222);
				lookat.r2c2.should.beCloseTo(-0.68825);
				lookat.r2c3.should.beCloseTo( 3.00000);
				
				lookat.r3c0.should.beCloseTo( 0.00000);
				lookat.r3c1.should.beCloseTo( 0.00000);
				lookat.r3c2.should.beCloseTo( 0.00000);
				lookat.r3c3.should.beCloseTo( 1.00000);

				//	-0.70711	 0.16222	 0.68825	-3.00000
				//	 0.00000	 0.97333	-0.22942	 1.00000
				//	-0.70711	-0.16222	-0.68825	 3.00000
				//	 0.00000	 0.00000	 0.00000	 1.00000
			});
		});
	}
}