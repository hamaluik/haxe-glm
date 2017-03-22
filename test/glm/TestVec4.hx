package glm;

import buddy.*;
using buddy.Should;

using glm.Vec4;

class TestVec4 extends BuddySuite {
	public function new() {
		describe('Using Vec4s', {
			var va:Vec4, vb:Vec4;

			beforeEach({
                va = new Vec4(1, 2, 3, 1);
                vb = new Vec4(-1, -2, -3, -1);
			});

			it("should provide element access", {
                va[2].should.be(3);
                va.y.should.be(2);
                va.x = 42;
                va[0].should.be(42);
			});

			it("should calculate the magnitude", {
				va.lengthSquared().should.be(15);
				va.length().should.beCloseTo(3.872983346207417);
			});

			it("should provide copy support", {
				va.copy(vb);
				va.equals(vb).should.be(true);
			});

			it("should provide vector math", {
				va.addVec(new Vec4(1, 1, 1, 1), vb);
				vb.equals(new Vec4(2, 3, 4, 2)).should.be(true);

				vb.subtractVec(new Vec4(1, 1, 1, 1), vb);
				vb.equals(va).should.be(true);
			});

			it("should provide scalar math", {
				va.addScalar(1, vb);
				vb.equals(new Vec4(2, 3, 4, 2)).should.be(true);
				va.multiplyScalar(0.5, vb);
				vb.equals(new Vec4(0.5, 1, 1.5, 0.5)).should.be(true);
			});

			it("should calculate distance between vectors", {
				va.distanceSquared(vb).should.beCloseTo(60);
				va.distance(vb).should.beCloseTo(7.745966692414834);
			});

			it("should calculate the dot product", {
				va.dot(vb).should.beCloseTo(-15);
			});

			it("should normalize", {
				var v:Vec4 = va.normalize(new Vec4());
				v.x.should.beCloseTo(0.2581988897471611);
				v.y.should.beCloseTo(0.5163977794943222);
				v.z.should.beCloseTo(0.7745966692414834);
				v.w.should.beCloseTo(0.2581988897471611);
			});

			it("should linearly interpolate", {
				var x:Vec4 = va.lerp(vb, 0.5, new Vec4());
				x.equals(new Vec4()).should.be(true);
			});
		});
	}
}