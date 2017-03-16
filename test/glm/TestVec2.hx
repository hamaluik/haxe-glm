package glm;

import buddy.*;
import glm.Vec2;
using buddy.Should;

class TestVec2 extends BuddySuite {
	public function new() {
		describe('Using Vec2s', {
			var v:Vec2;
			beforeEach({
				v = new Vec2(1, 2);
			});

			it("should provide a set function", {
				v.set(0, 5);
				v.set(1, 6);

				v.x.should.be(5);
				v.y.should.be(6);
			});

			it("should provide a get function", {
				v.get(0).should.be(1);
				v.get(1).should.be(2);
			});

			it("should calculate the length", {
				v.sqrLength.should.beCloseTo(5);
				v.length.should.beCloseTo(2.2360679775);
			});

			it("should add scalars", {
				v.addScalar(1);
				v.x.should.be(2);
				v.y.should.be(3);
			});

			it("should add other vectors", {
				v.addVec2(new Vec2(1, 2));
				v.x.should.be(2);
				v.y.should.be(4);
			});

			it("should subtract scalars", {
				v.subtractScalar(1);
				v.x.should.be(0);
				v.y.should.be(1);
			});

			it("should subtract other vectors", {
				v.subtractVec2(new Vec2(1, 2));
				v.x.should.be(0);
				v.y.should.be(0);
			});

			it("should multiply scalars", {
				v.multiply(3);
				v.x.should.be(3);
				v.y.should.be(6);
			});

			it("should convert to an array", {
				var arr:Array<Float> = v.toArray();
				for(i in 0...2) {
					v.get(i).should.be(arr[i]);
				}
			});

			it("should normalize", {
				v.normalize();
				v.x.should.beCloseTo(0.4472135955);
				v.y.should.beCloseTo(0.894427191);
			});

			it("should lerp", {
				var b:Vec2 = v.lerp(new Vec2(2, 3), 0.5);
				b.x.should.beCloseTo(1.5);
				b.y.should.beCloseTo(2.5);
			});

			it("should dot", {
				var b:Vec2 = v.clone();
				var x:Float = Vec2.dot(v, b);
				x.should.beCloseTo(5);
			});

			afterEach({
				v = null;
			});
		});
	}
}