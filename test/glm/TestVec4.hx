package glm;

import buddy.*;
using buddy.Should;
import glm.Vec4;

class TestVec4 extends BuddySuite {
	public function new() {
		describe('Using vectors', {
			var v:Vec4;
			before({
				v = new Vec4();
			});

			it("should create zero vectors", {
			});
			it("should calculate the length (2-norm) of a vector", {
			});
			it("should normalize a vector with a magnitude > 0", {
			});
			it("shouldn't crash when normalizing a vector with a magnitude of 0", {
			});
			it("should respect scalar math", {
			});
			it("should be able to add and subtract other vectors", {
			});
			it("should be able to calculate the dot product between two vectors", {
			});
			it('should be serializable', {
			});

			after({
				v = null;
			});
		});
	}
}