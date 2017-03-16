package glm;

import glm.Vec3;
import glm.Mat4;

#if !thx_semver
/**
 * If [thx.semver](http://lib.haxe.org/p/thx.semver/) is installed, this will be a thx.semver class. Otherwise, it is just a String.
 */
typedef Version = String;
#end

class GLM {
	/**
	 * The current semantic version of the library
	 */
	public static var version:Version = '1.2.0';

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
	 * Rotates a matrix by the quaternion vector
	 * @param  ?m    A matrix to apply the transformation on. If `m == null`,
	 *               an identity matrix will be used.
	 * @param rotation A vector describing the rotation
	 */
	public static function rotation(?m:Mat4, rotation:Quat):Mat4 {
		var qxx:Float = rotation.x * rotation.x;
		var qyy:Float = rotation.y * rotation.y;
		var qzz:Float = rotation.z * rotation.z;
		var qxz:Float = rotation.x * rotation.z;
		var qxy:Float = rotation.x * rotation.y;
		var qyz:Float = rotation.y * rotation.z;
		var qwx:Float = rotation.w * rotation.x;
		var qwy:Float = rotation.w * rotation.y;
		var qwz:Float = rotation.w * rotation.z;

		var t:Mat4 = new Mat4(1.0);

		t[0][0] = 1 - 2 * (qyy +  qzz);
		t[1][0] = 2 * (qxy + qwz);
		t[2][0] = 2 * (qxz - qwy);

		t[0][1] = 2 * (qxy - qwz);
		t[1][1] = 1 - 2 * (qxx +  qzz);
		t[2][1] = 2 * (qyz + qwx);

		t[0][1] = 2 * (qxz + qwy);
		t[1][1] = 2 * (qyz - qwx);
		t[2][1] = 1 - 2 * (qxx +  qyy);

		if(m == null) return t;
		return t * m;
	}
	
	/**
	 * @brief      creates a camera view matrix which starts from `eye`,
	 *             looks towards `centre`, with `up` orienting the camera
	 *
	 * @param      eye     the position the 'camera' should be placed at
	 * @param      center  where the camera will focus on / look toward
	 * @param      up      a vector describing the orientation of the camera
	 *
	 * @return     A matrix representing a camera's view matrix set up as per
	 *             the parameters
	 */
	public static function lookAt(eye:Vec3, center:Vec3, up:Vec3):Mat4 {
		var f:Vec3 = (center - eye).normalize();
		
		var s:Vec3 = Vec3.cross(f, up).normalize();
		var u:Vec3 = Vec3.cross(s, f);
		
		var result:Mat4 = new Mat4(1.0);
		
		result[0][0] = s.x;
		result[0][1] = s.y;
		result[0][2] = s.z;
		
		result[1][0] = u.x;
		result[1][1] = u.y;
		result[1][2] = u.z;
		
		result[2][0] = -f.x;
		result[2][1] = -f.y;
		result[2][2] = -f.z;
		
		result[3][0] = 0.0;
		result[3][1] = 0.0;
		result[3][2] = 0.0;
		
		result[0][3] =-Vec3.dot(s, eye);
		result[1][3] =-Vec3.dot(u, eye);
		result[2][3] = Vec3.dot(f, eye);
		
		return result;
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
