package;

import Sys;
import glm.GLM;
using glm.Mat4;
using glm.Vec3;
using glm.Vec4;
using glm.Quat;

class Sample {
	public static function main() {
		var P:Mat4 = GLM.perspective(45 * Math.PI / 180, 640 / 480, 0.1, 100, new Mat4());
		Sys.println('P:');
		Sys.println(P.toString());

		var camM:Mat4 = GLM.translate(new Vec3(0, 0, 6) , new Mat4());
		var V:Mat4 = camM.invert(new Mat4());
		Sys.println('V:');
		Sys.println(V.toString());

		var PV:Mat4 = P.multMat(V, new Mat4());
		Sys.println('PV:');
		Sys.println(PV.toString());

		var p3d:Vec4 = new Vec4(1, 1, 0, 1);
		var p2d:Vec4 = PV * p3d;
		Vec4.multiplyScalar(p2d, 1 / p2d.w, p2d);
		Sys.println(p3d.toString() + ' -> ' + p2d.toString());

		var rot:Quat = new Quat().identity();
		Sys.println('\nrot: ' + rot.toString());
	}
}