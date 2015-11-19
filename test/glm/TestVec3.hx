package glm;

import buddy.*;
using buddy.Should;
import glm.Vec3;

class TestVec3 extends BuddySuite {
	public function new() {
		describe('Using Vec3s', {
			var v:Vec3;
			before({
				v = new Vec3();
			});

			it("should create zero vectors", {
				v.zero();
				for(i in 0...3) {
					v[i].should.beCloseTo(0);
				}
			});
			it("should provide .xyz access", {
				v.x = 1;
				v.x.should.be(1);
				v.y = 2;
				v.y.should.be(2);
				v.z = 3;
				v.z.should.be(3);
			});
			it("should provide .rgb access", {
				v.r = 1;
				v.r.should.be(1);
				v.g = 2;
				v.g.should.be(2);
				v.b = 3;
				v.b.should.be(3);
			});
			it("should provide .stp access", {
				v.s = 1;
				v.s.should.be(1);
				v.t = 2;
				v.t.should.be(2);
				v.p = 3;
				v.p.should.be(3);
			});
			it("should calculate the length (2-norm) of a vector", {
				v.set(1, 2, 3);
				v.length().should.beCloseTo(3.741657386);
			});
			it("should normalize a vector with a magnitude > 0", {
				v.set(1, 2, 3);
				v.normalize();
				v[0].should.beCloseTo(0.2672612419);
				v[1].should.beCloseTo(0.5345224838);
				v[2].should.beCloseTo(0.8017837257);
			});
			it("shouldn't crash when normalizing a vector with a magnitude of 0", {
				v.zero();
				v.normalize.bind().should.not.throwType(String);
			});
			it("should respect scalar math", {
				v.set(1, 2, 3);
				v *= 2;
				v[0].should.beCloseTo(2);
				v[1].should.beCloseTo(4);
				v[2].should.beCloseTo(6);

				var b:Vec3 = v / 2;
				b[0].should.beCloseTo(1);
				b[1].should.beCloseTo(2);
				b[2].should.beCloseTo(3);

				v /= 2;
				b = 3 * v;
				b[0].should.beCloseTo(3);
				b[1].should.beCloseTo(6);
				b[2].should.beCloseTo(9);

				b = v + 0.5;
				b[0].should.beCloseTo(1.5);
				b[1].should.beCloseTo(2.5);
				b[2].should.beCloseTo(3.5);

				b = 0.5 + v;
				b[0].should.beCloseTo(1.5);
				b[1].should.beCloseTo(2.5);
				b[2].should.beCloseTo(3.5);

				b = v - 0.5;
				b[0].should.beCloseTo(0.5);
				b[1].should.beCloseTo(1.5);
				b[2].should.beCloseTo(2.5);

				b = 0.5 - v;
				b[0].should.beCloseTo(-0.5);
				b[1].should.beCloseTo(-1.5);
				b[2].should.beCloseTo(-2.5);
			});
			it("should be able to add and subtract other vectors", {
				v.set(1, 2, 3);
				v += new Vec3(0.25, 0.5, 0.75);
				v[0].should.beCloseTo(1.25);
				v[1].should.beCloseTo(2.5);
				v[2].should.beCloseTo(3.75);

				v -= new Vec3(0.25, 0.5, 0.75);
				v[0].should.beCloseTo(1);
				v[1].should.beCloseTo(2);
				v[2].should.beCloseTo(3);
			});
			it('should flatten into an array', {
				v.set(1, 2, 3);
				var res:Array<Float> = v.toArray();
				for(i in 0...3) {
					res[i].should.beCloseTo(v[i]);
				}
			});
			it('should calculate the dot product of two vectors', {
				v.set(1, 2, 3);
				var b:Vec3 = v.clone();
				var d:Float = Vec3.dot(v, b);
				d.should.beCloseTo(14);
			});
			it('should calculate the cross product of two vectors', {
				v.set(1, 0, 0);
				var b:Vec3 = new Vec3(0, 1, 0);
				var c:Vec3 = Vec3.cross(v, b);
				c.x.should.beCloseTo(0);
				c.y.should.beCloseTo(0);
				c.z.should.beCloseTo(1);
			});
			it('should be upgradeable to a Vec4', {
				v.set(1, 2, 3);
				var b:Vec4 = v.toVec4();
				b.x.should.be(1);
				b.y.should.be(2);
				b.z.should.be(3);
				b.w.should.be(0);
			});
			it('should be serializable', {
				v.set(1, 2, 3);

				var s:haxe.Serializer = new haxe.Serializer();
				s.serialize(v);
				var serialized:String = s.toString();

				var u:haxe.Unserializer = new haxe.Unserializer(serialized);
				var v2:Vec3 = u.unserialize();
				
				for(i in 0...3) {
					v2[i].should.beCloseTo(v[i]);
				}
			});

			after({
				v = null;
			});
		});
	}
}