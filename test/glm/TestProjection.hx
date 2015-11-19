package glm;

import buddy.*;
import glm.Projection;
using buddy.Should;

class TestProjection extends BuddySuite {
	public function new() {
		describe('Using Projection', {
			it('should be able to create ortho matrices', {});
			it('should be able to create perspective matrices', {});
			it('should be able to create frustum matrices', {});
			it('should be able to create infinitePerspective matrices', {});
			it('should be able to create a lookAt matrix', {});
			it('should be able to project from screen coordinates to world coordinates', {});
		});
	}
}