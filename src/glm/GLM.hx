package glm;

import glm.Vec3;
import glm.Mat4;

class GLM {
	/**
	 * Efficient and convenient access to Math.PI / 180.0
	 */
	public static inline var degToRad:Float = 0.017453292519943295;
	/**
	 * Efficient and convenient access to 180.0 / Math.PI
	 */
	public static inline var radToDeg:Float = 57.29577951308232;
	
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
		var q:Quat = new glm.Quat(
			Math.cos(angle),
			s * axis.x,
			s * axis.y,
			s * axis.z
		);
		return q;
	}

	/**
	 * Rotates the vector `v` by the quaternion `q` (typically constructed using
	 * `axisAngle`). Applies `q * v * q^-1`
	 * @param  q The quaternion to rotate with
	 * @param  v The vector to rotate
	 * @return   `v`, rotated by `q`
	 */
	public static function rotate(q:Quat, v:Vec3):Vec3 {
		q.normalize();
		var qv:Quat = new Quat(0, v.x, v.y, v.z);
		var r:Quat = (q * qv) * q.conjugate();
		return new Vec3(r.x, r.y, r.z);
	}

	/**
	 * Linearly interpolate a float between two values
	 * @param a the "starting" value
	 * @param b the "ending" value
	 * @param t a number in the range `[0, 1]` which describes how far along to
	 * interpolate.
	 */
	public static function lerp(a:Float, b:Float, t:Float):Float {
		return a + t * (b - a);
	}
}