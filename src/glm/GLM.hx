package glm;

import glm.Vec3;
import glm.Mat4;

class GLM {
	/**
	 * Translates a matrix by the 3D translation vector
	 * @param  ?m          A matrix to apply the transformation on. If `m == null`,
	 *                     an identity matrix will be used.
	 * @param  translation A vector describing the translation
	 */
	public static function translate(?m:Mat4, translation:Vec3):Mat4 {
		var t:Mat4 = new Mat4(1.0);
		t[0][3] = translation.x;
		t[1][3] = translation.y;
		t[2][3] = translation.z;
		if(m == null) return t;
		return t * m;
	}

	/**
	 * Scales a matrix by the 3D scale vector
	 * @param  ?m    A matrix to apply the transformation on. If `m == null`,
	 *               an identity matrix will be used.
	 * @param  scale A vector describing the scaling
	 */
	public static function scale(?m:Mat4, scale:Vec3):Mat4 {
		var t:Mat4 = new Mat4(1.0);
		t[0][0] = scale.x;
		t[1][1] = scale.y;
		t[2][2] = scale.z;
		if(m == null) return t;
		return t * m;
	}

	/**
	 * Constructs a quaternion which represents a rotation of `angle`
	 * around the axis `axis`.
	 * @param  axis  The axis to rotate about
	 * @param  angle The angle to rotate by (in radians)
	 * @return       A quaternion which can be used to rotate vectors in 3D
	 */
	public static function axisAngle(axis:Vec3, angle:Float):Quat {
		angle /= 2;
		var s:Float = Math.sin(angle);
		this[0] = Math.cos(angle);
		this[1] = s * angle.x;
		this[2] = s * angle.y;
		this[3] = s * angle.z;
		return cast this;
	}
}