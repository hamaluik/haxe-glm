package glm;

import buddy.*;
using buddy.Should;

using glm.Quat;

class TestQuat extends BuddySuite {
	public function new() {
		describe('Using Quats', {
			var qi:Quat, qx90:Quat, qa:Quat, qb:Quat;

			beforeEach({
				qi = new Quat(0, 0, 0, 1);
				qx90 = new Quat(0.70710678118, 0, 0, 0.70710678118);
				qa = new Quat(1, 2, 3, 4);
				qb = new Quat(5, 6, 7, 8);
			});

			it("should provide element access", {
				qx90.x.should.beCloseTo(0.70710678118);
				qi.y.should.be(0);
				qi.z.should.be(0);
				qi.w.should.be(1);
			});

			it("should calculate the length of the quat", {
				qi.length().should.beCloseTo(1);
				qa.lengthSquared().should.beCloseTo(30);
				qa.length().should.beCloseTo(5.47722557505);
			});

			it("should normalize", {
				qa.normalize(qa);
				qa.x.should.beCloseTo(0.18257418583505536);
				qa.y.should.beCloseTo(0.3651483716701107);
				qa.z.should.beCloseTo(0.5477225575051661);
				qa.w.should.beCloseTo(0.7302967433402214);
			});

			it("should calculate dot products", {
				qi.dot(qx90).should.beCloseTo(0.70710678118);
			});

			it("should create identity quaternions", {
				qx90.identity();
				qx90.x.should.be(0);
				qx90.y.should.be(0);
				qx90.z.should.be(0);
				qx90.w.should.be(1);
			});

			it("should provide a copy interface", {
				qa.copy(qi).equals(qa).should.be(true);
			});

			it("should construct a quaternion from an axis and an angle", {
				qa = Quat.axisAngle(new Vec3(1, 0, 0), Math.PI / 2, qa);
				qa.equals(qx90).should.be(true);
			});

			it("should multiply two quaternions together", {
				var qc:Quat = qa.multiplyQuats(qb, new Quat());
				qc.equals(new Quat(24, 48, 48, -6)).should.be(true);
				qc = qa * qi;
				qc.equals(qa).should.be(true);
			});

			it("should scale", {
				var qc:Quat = qa.multiplyScalar(2, new Quat());
				qc.equals(new Quat(2, 4, 6, 8)).should.be(true);
				qc = qc * 0.5;
				qc.equals(qa).should.be(true);
			});

			it("should lerp between two quaternions", {
				var qc:Quat = qa.lerp(qb, 0.5, new Quat());
				qc.equals(new Quat(3, 4, 5, 6)).should.be(true);
			});

			it("should slerp between two quaternions", {
				qa = new Quat(0.6753410084407496, 0.4087830051091744, 0.32856700410659473, 0.5185120064806223);
				qb = new Quat(0.6602792107657797, 0.43647413932562285, 0.35119011210236006, 0.5001871596632682);
				var qr:Quat = new Quat();

				qa.slerp(qb, 0, qr).equals(qa).should.be(true);
				qa.slerp(qb, 1, qr).equals(qb).should.be(true);

				qa.slerp(qb, 0.5, qr);
				Math.abs(qr.dot(qa) - qr.dot(qb)).should.beCloseTo(0);
				qr.length().should.beCloseTo(1);

				qa.slerp(qb, 0.25, qr);
				(qr.dot(qa) > qr.dot(qb)).should.be(true);
				qr.length().should.beCloseTo(1);

				qa.slerp(qb, 0.75, qr);
				(qr.dot(qa) < qr.dot(qb)).should.be(true);
				qr.length().should.beCloseTo(1);

				qa = new Quat(1, 0, 0, 0);
				qb = new Quat(0, 0, 1, 0);
				qr = qa.slerp(qb, 0.5, qr);
				qr.x.should.beCloseTo(Math.sqrt(0.5));
				qr.y.should.beCloseTo(Math.sqrt(0));
				qr.z.should.beCloseTo(Math.sqrt(0.5));
				qr.w.should.beCloseTo(Math.sqrt(0));
				qr.length().should.beCloseTo(1);

				qa = new Quat(0, Math.sqrt(0.5), 0, Math.sqrt(0.5));
				qb = new Quat(0, -Math.sqrt(0.5), 0, Math.sqrt(0.5));
				qr = qa.slerp(qb, 0.5, qr);
				qr.equals(qi).should.be(true);
				qr.length().should.beCloseTo(1);
			});

			it("should be able to invert", {
				var qr:Quat = qa.invert(new Quat());
				qr.x.should.beCloseTo(-0.03333333);
				qr.y.should.beCloseTo(-0.06666666);
				qr.z.should.beCloseTo(-0.1);
				qr.w.should.beCloseTo( 0.13333333);
			});

			it("should calculate the conjugate", {
				var qr:Quat = qa.conjugate(new Quat());
				qr.x.should.be(-1);
				qr.y.should.be(-2);
				qr.z.should.be(-3);
				qr.w.should.be(4);
			});

			it("should convert euler angles", {
				var qx:Quat = Quat.fromEuler(Math.PI / 2, 0, 0, new Quat());
				var qy:Quat = Quat.fromEuler(0, Math.PI / 2, 0, new Quat());
				var qz:Quat = Quat.fromEuler(0, 0, Math.PI / 2, new Quat());

				var x:Vec4 = new Vec4(1, 0, 0, 1);
				var y:Vec4 = new Vec4(0, 1, 0, 1);
				var z:Vec4 = new Vec4(0, 0, 1, 1);

				var m:Mat4 = new Mat4();
				var r:Vec4 = new Vec4();

				GLM.rotate(qx, m);
				Mat4.multVec(m, y, r);
				r.x.should.beCloseTo(0);
				r.y.should.beCloseTo(0);
				r.z.should.beCloseTo(1);
				r.w.should.beCloseTo(1);

				GLM.rotate(qy, m);
				Mat4.multVec(m, x, r);
				r.x.should.beCloseTo(0);
				r.y.should.beCloseTo(0);
				r.z.should.beCloseTo(-1);
				r.w.should.beCloseTo(1);

				GLM.rotate(qz, m);
				Mat4.multVec(m, x, r);
				r.x.should.beCloseTo(0);
				r.y.should.beCloseTo(1);
				r.z.should.beCloseTo(0);
				r.w.should.beCloseTo(1);
			});
		});
	}
}