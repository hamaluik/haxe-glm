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

			after({
				q = null;
			});
		});
	}
}