package glm;

import buddy.*;
import glm.Projection;
using buddy.Should;

class TestProjection extends BuddySuite {
	public function new() {
		describe('Using Projection', {
			var m:Mat4;

			it('should be able to create ortho matrices', {
				var r:Float = 4;
				var t:Float = 2;
				var n:Float = 0.1;
				var f:Float = 1000;
				m = Projection.ortho(-r, r, -t, t, n, f);
				var e:Mat4 = Mat4.fromRows(
					new Vec4(1/r, 0, 0, 0),
					new Vec4(0, 1/t, 0, 0),
					new Vec4(0, 0, -2/(f-n), -(f+n)/(f-n)),
					new Vec4(0, 0, 0, 1)
				);
				for(i in 0...4) {
					for(j in 0...4) {
						m[i][j].should.beCloseTo(e[i][j]);
					}
				}
			});
			it('should be able to create perspective matrices', {
				var a:Float = 30 * Math.PI / 180;
				var r:Float = 1.2;
				var n:Float = 0.1;
				var f:Float = 1000;
				m = Projection.perspective(a, r, n, f);
				var e:Mat4 = Mat4.fromRows(
					new Vec4(1/(r*Math.tan(a/2)), 0, 0, 0),
					new Vec4(0, 1/Math.tan(a/2), 0, 0),
					new Vec4(0, 0, -(f+n)/(f-n), -2*f*n/(f-n)),
					new Vec4(0, 0, -1, 1)
				);
				for(i in 0...4) {
					for(j in 0...4) {
						m[i][j].should.beCloseTo(e[i][j]);
					}
				}
			});
			it('should be able to create frustum matrices', {
				var r:Float = 4;
				var t:Float = 2;
				var n:Float = 0.1;
				var f:Float = 1000;
				m = Projection.frustum(-r, r, -t, t, n, f);
				var e:Mat4 = Mat4.fromRows(
					new Vec4(n/r, 0, 0, 0),
					new Vec4(0, n/t, 0, 0),
					new Vec4(0, 0, -(f+n)/(f-n), -2*f*n/(f-n)),
					new Vec4(0, 0, -1, 0)
				);
				for(i in 0...4) {
					for(j in 0...4) {
						m[i][j].should.beCloseTo(e[i][j]);
					}
				}
			});

			after({
				m = null;
			});
		});
	}
}