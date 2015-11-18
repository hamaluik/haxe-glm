package glm;

import buddy.*;
using buddy.Should;
import glm.Vec3;

class TestVec3 extends BuddySuite {
	public function new() {
		describe('Using Vec3', {
			var v:Vec3;
			before({
				v = new Vec3();
			});

			it("should create zero vectors", {
				v.zero();
				v[0].should.be(0);
				v[1].should.be(0);
				v[2].should.be(0);
			});
			it("should calculate the length (2-norm) of a vector", {
				v.set(3, 4, 0);
				v.length().should.be(5);
			});
			it("should normalize a vector with a magnitude > 0", {
				v.set(1, 2, 3);
				v.normalize();
				v[0].should.beCloseTo(0.2673, 4);
				v[1].should.beCloseTo(0.5345, 4);
				v[2].should.beCloseTo(0.8018, 4);
			});
			it("shouldn't crash when normalizing a vector with a magnitude of 0", {
				v.set(0, 0, 0);
				v.normalize.should.not.throwType(String);
			});
			it("should respect scalar math", {
			});
			it("should be able to add and subtract other vectors", {
				v.set(4, 5, 6);
				var b:Vec3 = new Vec3(1, 2, 3);
				v.add(b);

				v[0].should.be(5);
				v[1].should.be(7);
				v[2].should.be(9);

				v.subtract(b);

				v[0].should.be(4);
				v[1].should.be(5);
				v[2].should.be(6);
			});
			it("should be able to calculate the cross-product between two vectors", {
				v.set(1, 0, 0);
				var b:Vec3 = new Vec3(0, 1, 0);
				v.cross(b);
				v[0].should.be(0);
				v[1].should.be(0);
				v[2].should.be(1);
			});
			it("should be able to calculate the dot product between two vectors", {
				v.set(1, 2, 3);
				var b:Vec3 = new Vec3(4, 5, 6);
				var r:Float = v.dot(b);
				r.should.be(32);
			});
			it('should be serializable', {
				v.set(42, 5, 11);

				var s:haxe.Serializer = new haxe.Serializer();
				s.serialize(v);
				var serialized:String = s.toString();

				var u:haxe.Unserializer = new haxe.Unserializer(serialized);
				var b:Vec3 = u.unserialize();
				
				var out:Array<Float> = [42, 5, 11];
				for(i in 0...16) {
					b[i].should.be(out[i]);
				}
			});

			after({
				v = null;
			});
		});
	}
}