package;

import Sys;
import glm.GLM;
import glm.Mat4;
import glm.Vec4;

class Sample {
    public static function main() {
        var P:Mat4 = GLM.perspective(45 * Math.PI / 180, 640 / 480, 0.1, 100, new Mat4());
        Sys.println('P:');
        Sys.println(P.toString());

        var camM:Mat4 = GLM.translate(0, 0, 6, new Mat4());
        var V:Mat4 = Mat4.invert(camM, new Mat4());
        Sys.println('V:');
        Sys.println(V.toString());

        var PV:Mat4 = Mat4.multMat(P, V, new Mat4());
        Sys.println('PV:');
        Sys.println(PV.toString());

        var p3d:Vec4 = new Vec4(1, 1, 0, 1);
        var p2d:Vec4 = PV * p3d;
        Vec4.multiplyScalar(p2d, 1 / p2d.w, p2d);
        Sys.println(p3d.toString() + ' -> ' + p2d.toString());
    }
}