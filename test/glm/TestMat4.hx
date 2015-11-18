package glm;

import buddy.*;
import glm.Mat4;
using buddy.Should;

class TestMat4 extends BuddySuite {
	public function new() {
		describe('Using Mat4', {
			var ma:Mat4;
			before({
				ma = new Mat4();
			});

			it('should be able to create a zero matrix', {
			});
			it('should be able to create an identity matrix', {
			});
			it('should allow array access', {
			});
			it('should be able to multliply vec4s with itself', {
			});
			it('should be able to multliply mat4s with itself', {
			});
			it('should be serializable', {
			});

			after({
				ma = null;
			});
		});
	}
}