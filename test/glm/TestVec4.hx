package glm;

import buddy.*;
using buddy.Should;
import glm.Vec4;

class TestVec4 extends BuddySuite {
	public function new() {
		describe('Using Vec4s', {
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
			it("should provide .xyzw access", {
				v.x = 1;
				v.x.should.be(1);
				v.y = 2;
				v.y.should.be(2);
				v.z = 3;
				v.z.should.be(3);
				v.w = 4;
				v.w.should.be(4);
			});
			it("should provide .rgba access", {
				v.r = 1;
				v.r.should.be(1);
				v.g = 2;
				v.g.should.be(2);
				v.b = 3;
				v.b.should.be(3);
				v.a = 4;
				v.a.should.be(4);
			});
			it("should provide .stpq access", {
				v.s = 1;
				v.s.should.be(1);
				v.t = 2;
				v.t.should.be(2);
				v.p = 3;
				v.p.should.be(3);
				v.q = 4;
				v.q.should.be(4);
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
				v *= 2;
				v[0].should.beCloseTo(2);
				v[1].should.beCloseTo(4);
				v[2].should.beCloseTo(6);
				v[3].should.beCloseTo(8);

				var b:Vec4 = v / 2;
				b[0].should.beCloseTo(1);
				b[1].should.beCloseTo(2);
				b[2].should.beCloseTo(3);
				b[3].should.beCloseTo(4);

				v /= 2;
				b = 3 * v;
				b[0].should.beCloseTo(3);
				b[1].should.beCloseTo(6);
				b[2].should.beCloseTo(9);
				b[3].should.beCloseTo(12);

				b = v + 0.5;
				b[0].should.beCloseTo(1.5);
				b[1].should.beCloseTo(2.5);
				b[2].should.beCloseTo(3.5);
				b[3].should.beCloseTo(4.5);

				b = 0.5 + v;
				b[0].should.beCloseTo(1.5);
				b[1].should.beCloseTo(2.5);
				b[2].should.beCloseTo(3.5);
				b[3].should.beCloseTo(4.5);

				b = v - 0.5;
				b[0].should.beCloseTo(0.5);
				b[1].should.beCloseTo(1.5);
				b[2].should.beCloseTo(2.5);
				b[3].should.beCloseTo(3.5);

				b = 0.5 - v;
				b[0].should.beCloseTo(-0.5);
				b[1].should.beCloseTo(-1.5);
				b[2].should.beCloseTo(-2.5);
				b[3].should.beCloseTo(-3.5);
			});
			it("should be able to add and subtract other vectors", {
				v.set(1, 2, 3, 4);
				v += new Vec4(0.25, 0.5, 0.75, 1);
				v[0].should.beCloseTo(1.25);
				v[1].should.beCloseTo(2.5);
				v[2].should.beCloseTo(3.75);
				v[3].should.beCloseTo(5);

				v -= new Vec4(0.25, 0.5, 0.75, 1);
				v[0].should.beCloseTo(1);
				v[1].should.beCloseTo(2);
				v[2].should.beCloseTo(3);
				v[3].should.beCloseTo(4);
			});
			it('should flatten into an array', {
				v.set(1, 2, 3, 4);
				var res:Array<Float> = v.toArray();
				for(i in 0...4) {
					res[i].should.beCloseTo(v[i]);
				}
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