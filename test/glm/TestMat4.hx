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

			it('should allow array access', {
			});
			it('should take an array of floats as a constructor', {
				function() {
					ma = new Mat4([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
				}.should.not.throwType(String);
				function() {
					ma = new Mat4([]);
				}.should.throwType(String);
			});
			it('should be able to create a zero matrix', {
			});
			it('should be able to create an identity matrix', {
			});
			it('should be able to transpose itself', {
			});
			it('should be able to multliply itself by another matrix', {
			});
			it('should be able to multliply matrices using the multiplication operator', {
			});
			it('should be serializable', {
			});

			after({
				ma = null;
			});
		});
	}
}