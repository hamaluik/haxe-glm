package glm;

import buddy.*;
using buddy.Should;

using glm.Mat3;

class TestMat3 extends BuddySuite {
	public function new() {
		describe('Using Mat3s', {
			var ma:Mat3, mb:Mat3, mono:Mat3;

			beforeEach({
				ma = new Mat3(
					1, 0, 1,
					0, 1, 2,
					0, 0, 1
				);

				mb = new Mat3(
					1, 0, 4,
					0, 1, 5,
					0, 0, 1
				);

				mono = new Mat3(
					1, 2, 3,
					4, 5, 6,
					7, 8, 9
				);
			});

			it("should provide element access", {
				ma.r0c2.should.be(1);
				ma.r1c2.should.be(2);
				ma.r2c2.should.be(1);

				ma.r0c1 = 42;
				ma.r0c1.should.be(42);
			});

			it("should access elements in column-major order", {
				ma[3].should.be(ma.r0c1);
				ma[7].should.be(ma.r1c2);
			});

			it("should provide an identity", {
				ma = Mat3.identity(new Mat3());

				var identity:Mat3 = new Mat3(
					1, 0, 0,
					0, 1, 0,
					0, 0, 1);
				ma.equals(identity).should.be(true);
			});

			it("should provide copy support", {
				ma[0] = 5;
				ma[8] = 42;
				mb = ma.copy(new Mat3());
				mb.equals(ma).should.be(true);
			});

			it("should be able to transpose", {
				ma = new Mat3(
					0, 1, 2,
					3, 4, 5,
					6, 7, 8
				);
				var mb = ma.transpose(new Mat3());
				mb.r1c0.should.be(1);
				mb.r0c2.should.be(6);
			});

			it("should calculate the determinant");

			it("should invert");

			it("should multiply other matrices");

			it("should multiply vectors");
		});
	}
}
