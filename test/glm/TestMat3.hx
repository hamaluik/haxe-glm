package glm;

import buddy.*;
using buddy.Should;

using glm.Mat3;

class TestMat3 extends BuddySuite {
	public function new() {
		describe('Using Mat3s', {
			var ma:Mat3, mb:Mat3, mono:Mat3;

			beforeEach({
			});

			it("should provide element access");

			it("should store element in column-major order");

			it("should provide an identity");

			it("should provide copy support");

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
