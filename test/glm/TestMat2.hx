package glm;

import buddy.*;
using buddy.Should;

using glm.Mat2;

class TestMat2 extends BuddySuite {
	public function new() {
		describe('Using Mat2s', {
			var ma:Mat2, mb:Mat2, mono:Mat2;

			beforeEach({
			});

			it("should provide element access");

			it("should store element in column-major order");

			it("should provide an identity");

			it("should provide copy support");

			it("should be able to transpose", {
				ma = new Mat2(
					0, 1,
                    2, 3
				);
				var mb = ma.transpose(new Mat2());
				mb.r0c1.should.be(2);
                mb.r1c0.should.be(1);
			});

			it("should calculate the determinant");

			it("should invert");

			it("should multiply other matrices");

			it("should multiply vectors");
		});
	}
}
