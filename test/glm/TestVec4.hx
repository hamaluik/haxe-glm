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
				v.zero();
				for(i in 0...4) {
					v[i].should.beCloseTo(0);
				}
			});
			it("should calculate the length (2-norm) of a vector", {
				v.set(1, 2, 3, 4);
				v.length().should.beCloseTo(5.477225575);
			});
			it("should normalize a vector with a magnitude > 0", {
				v.set(1, 2, 3, 4);
				v.normalize();
				v[0].should.beCloseTo(0.1825741858);
				v[1].should.beCloseTo(0.3651483716);
				v[2].should.beCloseTo(0.5477225575);
				v[3].should.beCloseTo(0.7302967433);
			});
			it("shouldn't crash when normalizing a vector with a magnitude of 0", {
				v.zero();
				v.normalize.bind().should.not.throwType(String);
			});
			it("should respect scalar math", {
				v.set(1, 2, 3, 4);
				v.multiplyScalar(2);
				v[0].should.beCloseTo(2);
				v[1].should.beCloseTo(4);
				v[2].should.beCloseTo(6);
				v[3].should.beCloseTo(8);
			});
			it("should be able to add and subtract other vectors", {
				v.set(1, 2, 3, 4);
				v.add(new Vec4(0.25, 0.5, 0.75, 1));
				v[0].should.beCloseTo(1.25);
				v[1].should.beCloseTo(2.5);
				v[2].should.beCloseTo(3.75);
				v[3].should.beCloseTo(5);

				v.subtract(new Vec4(0.25, 0.5, 0.75, 1));
				v[0].should.beCloseTo(1);
				v[1].should.beCloseTo(2);
				v[2].should.beCloseTo(3);
				v[3].should.beCloseTo(4);
			});
			it('should be serializable', {
				v.set(1, 2, 3, 4);

				var s:haxe.Serializer = new haxe.Serializer();
				s.serialize(v);
				var serialized:String = s.toString();

				var u:haxe.Unserializer = new haxe.Unserializer(serialized);
				var v2:Vec4 = u.unserialize();
				
				for(i in 0...4) {
					v2[i].should.beCloseTo(v[i]);
				}
			});

			after({
				v = null;
			});
		});
	}
}