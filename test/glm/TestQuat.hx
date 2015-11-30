package glm;

import buddy.*;
using buddy.Should;
import glm.Quat;

class TestQuat extends BuddySuite {
	public function new() {
		describe('Using Quats', {
			var q:Quat;
			before({
				q = new Quat();
			});

			it("should provide .xyzw access", {
				q.x = 1;
				q.x.should.be(1);
				q.y = 2;
				q.y.should.be(2);
				q.z = 3;
				q.z.should.be(3);
				q.w = 4;
				q.w.should.be(4);
			});
			it('should flatten into an array', {
				q.set(1, 2, 3, 4);
				var res:Array<Float> = q.toArray();
				for(i in 0...4) {
					res[i].should.beCloseTo(q[i]);
				}
			});
			it('should be able to create an identity quaternion', {
				q = Quat.identity();
				q.w.should.beCloseTo(1);
				q.x.should.beCloseTo(0);
				q.y.should.beCloseTo(0);
				q.z.should.beCloseTo(0);
			});
			it('should be serializable', {
				q.set(1, 2, 3, 4);

				var s:haxe.Serializer = new haxe.Serializer();
				s.serialize(q);
				var serialized:String = s.toString();

				var u:haxe.Unserializer = new haxe.Unserializer(serialized);
				var q2:Quat = u.unserialize();
				
				for(i in 0...4) {
					q2[i].should.beCloseTo(q[i]);
				}
			});
			it('should be possible to multiply two quaternions together', {
				q.set(1, 2, 3, 4);
				var q2:Quat = new Quat(4, 3, 2, 1);
				var r:Quat = q * q2;
				r.w.should.beCloseTo(-12);
				r.x.should.beCloseTo(6);
				r.y.should.beCloseTo(24);
				r.z.should.beCloseTo(12);
			});
			it('should give the same value for inverted quaternions and conjugated normalized quaternions', {
				q.set(1, 2, 3, 4);
				q.normalize();
				var qc:Quat = q.clone().conjugate();
				var qi:Quat = q.clone().invert();
				qi.w.should.beCloseTo(qc.w);
				qi.x.should.beCloseTo(qc.x);
				qi.y.should.beCloseTo(qc.y);
				qi.z.should.beCloseTo(qc.z);
			});

			after({
				q = null;
			});
		});
	}
}