package glm;

import buddy.*;
using buddy.Should;

using glm.Mat4;

class TestMat4 extends BuddySuite {
	public function new() {
		describe('Using Mat4s', {
			var ma:Mat4, mb:Mat4;

			beforeEach({
				ma = new Mat4(
					1, 0, 0, 0,
					0, 1, 0, 0,
					0, 0, 1, 0,
					1, 2, 3, 1
				);

				mb = new Mat4(
					1, 0, 0, 0,
					0, 1, 0, 0,
					0, 0, 1, 0,
					4, 5, 6, 1
				);
			});

			it("should provide element access", {
				ma.r3c0.should.be(1);
				ma.r3c1.should.be(2);
				ma.r3c2.should.be(3);
				ma.r0c3.should.be(0);

				ma.r0c0 = 42;
				ma.r0c0.should.be(42);
			});

			it("should store element in column-major order", {
				ma[3].should.be(ma.r3c0);
				ma[7].should.be(ma.r3c1);
				ma[11].should.be(ma.r3c2);
				ma[15].should.be(ma.r3c3);
			});

			it("should provide an identity", {
				ma = Mat4.identity(new Mat4());

				var identity:Mat4 = new Mat4(
					1, 0, 0, 0,
					0, 1, 0, 0,
					0, 0, 1, 0,
					0, 0, 0, 1);
				ma.equals(identity).should.be(true);
			});

			it("should provide copy support", {
				ma[0] = 5;
				ma[9] = 42;
				mb = ma.copy(new Mat4());
				mb.equals(ma).should.be(true);
			});

			it("should be able to transpose", {
				mb = ma.transpose(new Mat4());
				mb[12].should.beCloseTo(1);
				mb[13].should.beCloseTo(2);
				mb[14].should.beCloseTo(3);
				var mc:Mat4 = new Mat4();
				ma.transpose(mc);
				mc.equals(mb).should.be(true);
			});

			it("should calculate the determinant", {
				ma.determinant().should.beCloseTo(1);
			});

			it("should invert", {
				var target:Mat4 = new Mat4(
					1, 0, 0, 0,
					0, 1, 0, 0,
					0, 0, 1, 0,
					-1, -2, -3, 1
				);

				mb = ma.invert(new Mat4());
				target.equals(mb).should.be(true);
			});

			it("should multiply other matrices", {
				var mc:Mat4 = ma.multMat(mb, new Mat4());
				var target:Mat4 = new Mat4(
					1, 0, 0, 0,
					0, 1, 0, 0,
					0, 0, 1, 0,
					5, 7, 9, 1
				);
				target.equals(mc).should.be(true);
			});

			it("should multiply vectors", {
				var v:Vec4 = new Vec4(0, 0, 0, 1);
				var va:Vec4 = ma.multVec(v, new Vec4());
				va.equals(new Vec4(1, 2, 3, 1)).should.be(true);
			});
		});
	}
}