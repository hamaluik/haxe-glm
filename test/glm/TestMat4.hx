package glm;

import buddy.*;
import glm.Mat4;
using buddy.Should;

using glm.Mat4;

class TestMat4 extends BuddySuite {
	public function new() {
		describe('Using Mat4s', {
			var ma:Mat4;

			var identity:Mat4 = new Mat4(
				1, 0, 0, 0,
				0, 1, 0, 0,
				0, 0, 1, 0,
				0, 0, 0, 1);

			beforeEach({
				ma = new Mat4();
			});

			it("should provide an identity", {
				ma = Mat4.identity();
				ma.equals(identity).should.be(true);
			});

			it("should provide copy support", {
				ma.e[0] = 5;
				ma.e[9] = 42;
				var mb:Mat4 = new Mat4();
				ma.copy(mb);
				mb.equals(ma).should.be(true);
			});

			afterEach({
				ma = null;
			});
		});
	}
}