package glm;

import glm.Vec3;
import glm.Vec4;
import glm.Mat4;

class Projection {
	public static function ortho(left:Float, right:Float, bottom:Float, top:Float, near:Float=-1, far:Float=1):Mat4 {
		var result:Mat4 = Mat4.fromRows(
			new Vec4(2 / (right - left), 0, 0, -(right + left) / (right - left)),
			new Vec4(0, 2 / (top -bottom), 0, -(top + bottom) / (top - bottom)),
			new Vec4(0, 0, -2 / (far - near), -(far + near) / (far - near)),
			new Vec4(0, 0, 0, 1)
		);
		return result;
	}

	public static function perspective(fovy:Float, aspect:Float, near:Float, far:Float):Mat4 {
		var result:Mat4 = Mat4.identity();
		/*var depth:Float = far - near;
		var oneOverDepth:Float = 1.0 / depth;
		result[1][1] = 1 / Math.tan(0.5 * fovy);
		result[0][0] = result[1][1] / aspect;
		result[2][2] = far * oneOverDepth;
		result[3][2] = (-far * near) * oneOverDepth;
		result[2][3] = 1;
		result[3][3] = 0;*/
		/*result[0][0] = 1 / (aspect * Math.tan(fovy / 2));
		result[1][1] = 1 / (Math.tan(fovy / 2));
		result[2][2] = -(far + near) / (far - near);
		result[3][2] = -1;
		result[2][3] = -(2 * far * near) / (far - near);*/

		var fovx:Float = aspect * fovy;
		
		result[0][0] = 1 / Math.tan(0.5 * fovx);
		result[1][1] = 1 / Math.tan(0.5 * fovy);
		result[2][2] = -(far + near) / (far - near);
		result[2][3] = -2 * (near * far) / (far - near);
		result[2][3] = -1;
		result[3][3] = 0;

		return result;
	}

	public static function frustum(left:Float, right:Float, bottom:Float, top:Float, near:Float=-1, far:Float=1):Mat4 {
		var result:Mat4 = Mat4.fromRows(
			new Vec4(2*near/(right-left), 0, (right+left)/(right-left), 0),
			new Vec4(0, 2*near/(top-bottom), (top+bottom)/(top-bottom), 0),
			new Vec4(0, 0, -(far+near)/(far-near), -2*far*near/(far-near)),
			new Vec4(0, 0, -1, 0)
		);
		return result;
	}
}