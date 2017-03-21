package glm;

import glm.GLM.FloatArray;

class Mat4 {
	/**
	 *  The actual data stored in the matrix. Note that it is stored according to WebGL standards (i.e. the translation components of a matrix using these elements occupy the 13th, 14th, and 15th elements)
	 */
	public var e:FloatArray;

	public function new(
			r0c0:Float = 0, r0c1:Float = 0, r0c2:Float = 0, r0c3:Float = 0,
			r1c0:Float = 0, r1c1:Float = 0, r1c2:Float = 0, r1c3:Float = 0,
			r2c0:Float = 0, r2c1:Float = 0, r2c2:Float = 0, r2c3:Float = 0,
			r3c0:Float = 0, r3c1:Float = 0, r3c2:Float = 0, r3c3:Float = 0) {
		this.e = new FloatArray(16);
		e[0] = r0c0;
		e[1] = r1c0;
		e[2] = r2c0;
		e[3] = r3c0;

		e[4] = r0c1;
		e[5] = r1c1;
		e[6] = r2c1;
		e[7] = r3c1;

		e[8] = r0c2;
		e[9] = r1c2;
		e[10] = r2c2;
		e[11] = r3c2;

		e[12] = r0c3;
		e[13] = r1c3;
		e[14] = r2c3;
		e[15] = r3c3;
	}

	/**
	 *  Tests if two matrices are equal on an element-by-element basis
	 *  @param m - the other matrix to check
	 *  @return Bool
	 */
	public function equals(m:Mat4):Bool {
		for(i in 0...16) {
			if(Math.abs(e[i] - m.e[i]) >= 0.000000001) {
				return false;
			}
		}
		return true;
	}

	/**
	 *  Gets a string representation of the matrix
	 *  @return String
	 */
	public function toString():String {
		return
			'[${e[0]}, ${e[4]}, ${e[8]}, ${e[12]}]\n' +
			'[${e[1]}, ${e[5]}, ${e[9]}, ${e[13]}]\n' +
			'[${e[2]}, ${e[6]}, ${e[10]}, ${e[14]}]\n' +
			'[${e[3]}, ${e[7]}, ${e[11]}, ${e[15]}]\n';
	}

	/**
	 *  Fill `dest` with an identity matrix
	 *  @param dest - the matrix to fill out
	 *  @return Mat4
	 */
	public static function identity(dest:Mat4):Mat4 {
		dest.e[0] = 1;
		dest.e[1] = 0;
		dest.e[2] = 0;
		dest.e[3] = 0;

		dest.e[4] = 0;
		dest.e[5] = 1;
		dest.e[6] = 0;
		dest.e[7] = 0;

		dest.e[8] = 0;
		dest.e[9] = 0;
		dest.e[10] = 1;
		dest.e[11] = 0;

		dest.e[12] = 0;
		dest.e[13] = 0;
		dest.e[14] = 0;
		dest.e[15] = 1;

		return dest;
	}

	/**
	 *  Copies one matrix into another
	 *  @param src - The matrix to copy from
	 *  @param dest - The matrix to copy into
	 *  @return Mat4
	 */
	public static function copy(src:Mat4, dest:Mat4):Mat4 {
		dest.e[0] = src.e[0];
		dest.e[1] = src.e[1];
		dest.e[2] = src.e[2];
		dest.e[3] = src.e[3];
		dest.e[4] = src.e[4];
		dest.e[5] = src.e[5];
		dest.e[6] = src.e[6];
		dest.e[7] = src.e[7];
		dest.e[8] = src.e[8];
		dest.e[9] = src.e[9];
		dest.e[10] = src.e[10];
		dest.e[11] = src.e[11];
		dest.e[12] = src.e[12];
		dest.e[13] = src.e[13];
		dest.e[14] = src.e[14];
		dest.e[15] = src.e[15];
		return dest;
	}

	/**
	 *  Transposes a matrix
	 *  @param src - The matrix to transpose
	 *  @param dest - The destination matrix. Call with `src == dest` to modify `src` in place
	 *  @return Mat4
	 */
	public static function transpose(src:Mat4, dest:Mat4):Mat4 {
		var src01 = src.e[1];
		var src02 = src.e[2];
		var src03 = src.e[3];
		var src12 = src.e[6];
		var src13 = src.e[7];
		var src23 = src.e[11];

		dest.e[0] = src.e[0];
		dest.e[1] = src.e[4];
		dest.e[2] = src.e[8];
		dest.e[3] = src.e[12];
		dest.e[4] = src01;
		dest.e[5] = src.e[5];
		dest.e[6] = src.e[9];
		dest.e[7] = src.e[13];
		dest.e[8] = src02;
		dest.e[9] = src12;
		dest.e[10] = src.e[10];
		dest.e[11] = src.e[14];
		dest.e[12] = src03;
		dest.e[13] = src13;
		dest.e[14] = src23;
		dest.e[15] = src.e[15];

		return dest;
	}

	/**
	 *  Calculates the determinant of the matrix
	 *  @param src - The matrix to calculate the determinant of
	 *  @return Float
	 */
	public static function determinant(src:Mat4):Float {
		var a00:Float = src.e[0], a01:Float = src.e[1], a02:Float = src.e[2], a03:Float = src.e[3],
		    a10:Float = src.e[4], a11:Float = src.e[5], a12:Float = src.e[6], a13:Float = src.e[7],
		    a20:Float = src.e[8], a21:Float = src.e[9], a22:Float = src.e[10], a23:Float = src.e[11],
		    a30:Float = src.e[12], a31:Float = src.e[13], a32:Float = src.e[14], a33:Float = src.e[15];

		var b00:Float = a00 * a11 - a01 * a10,
		    b01:Float = a00 * a12 - a02 * a10,
		    b02:Float = a00 * a13 - a03 * a10,
		    b03:Float = a01 * a12 - a02 * a11,
		    b04:Float = a01 * a13 - a03 * a11,
		    b05:Float = a02 * a13 - a03 * a12,
		    b06:Float = a20 * a31 - a21 * a30,
		    b07:Float = a20 * a32 - a22 * a30,
		    b08:Float = a20 * a33 - a23 * a30,
		    b09:Float = a21 * a32 - a22 * a31,
		    b10:Float = a21 * a33 - a23 * a31,
		    b11:Float = a22 * a33 - a23 * a32;

		return b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;
	}

	/**
	 *  Inverts the `src` matrix, storing the result in `dest`. If `src == dest`, modifies `src` in place.
	 *  @param src - The source matrix
	 *  @param dest - The matrix to store the result in
	 *  @return Mat4
	 */
	public static function invert(src:Mat4, dest:Mat4):Mat4 {
		var a00:Float = src.e[0], a01:Float = src.e[1], a02:Float = src.e[2], a03:Float = src.e[3],
		    a10:Float = src.e[4], a11:Float = src.e[5], a12:Float = src.e[6], a13:Float = src.e[7],
		    a20:Float = src.e[8], a21:Float = src.e[9], a22:Float = src.e[10], a23:Float = src.e[11],
		    a30:Float = src.e[12], a31:Float = src.e[13], a32:Float = src.e[14], a33:Float = src.e[15];

		var b00:Float = a00 * a11 - a01 * a10,
		    b01:Float = a00 * a12 - a02 * a10,
		    b02:Float = a00 * a13 - a03 * a10,
		    b03:Float = a01 * a12 - a02 * a11,
		    b04:Float = a01 * a13 - a03 * a11,
		    b05:Float = a02 * a13 - a03 * a12,
		    b06:Float = a20 * a31 - a21 * a30,
		    b07:Float = a20 * a32 - a22 * a30,
		    b08:Float = a20 * a33 - a23 * a30,
		    b09:Float = a21 * a32 - a22 * a31,
		    b10:Float = a21 * a33 - a23 * a31,
		    b11:Float = a22 * a33 - a23 * a32;

		var det:Float = b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;
		if (Math.abs(det) <= 0.0000001) {
			throw 'Can\'t invert matrix, det (${det}) is too small!';
		}
		det = 1.0 / det;

		dest.e[0] = (a11 * b11 - a12 * b10 + a13 * b09) * det;
		dest.e[1] = (a02 * b10 - a01 * b11 - a03 * b09) * det;
		dest.e[2] = (a31 * b05 - a32 * b04 + a33 * b03) * det;
		dest.e[3] = (a22 * b04 - a21 * b05 - a23 * b03) * det;
		dest.e[4] = (a12 * b08 - a10 * b11 - a13 * b07) * det;
		dest.e[5] = (a00 * b11 - a02 * b08 + a03 * b07) * det;
		dest.e[6] = (a32 * b02 - a30 * b05 - a33 * b01) * det;
		dest.e[7] = (a20 * b05 - a22 * b02 + a23 * b01) * det;
		dest.e[8] = (a10 * b10 - a11 * b08 + a13 * b06) * det;
		dest.e[9] = (a01 * b08 - a00 * b10 - a03 * b06) * det;
		dest.e[10] = (a30 * b04 - a31 * b02 + a33 * b00) * det;
		dest.e[11] = (a21 * b02 - a20 * b04 - a23 * b00) * det;
		dest.e[12] = (a11 * b07 - a10 * b09 - a12 * b06) * det;
		dest.e[13] = (a00 * b09 - a01 * b07 + a02 * b06) * det;
		dest.e[14] = (a31 * b01 - a30 * b03 - a32 * b00) * det;
		dest.e[15] = (a20 * b03 - a21 * b01 + a22 * b00) * det;

		return dest;
	}

	/**
	 *  Multiplies two matrices together, storing the result in `dest`. Caches `a` and `b` so `a == dest` and `b == dest` are valid.
	 *  @param a - The left-hand matrix
	 *  @param b - The right-hand matrix
	 *  @param dest - The matrix to store the result in
	 *  @return Mat4
	 */
	public static function multMat(a:Mat4, b:Mat4, dest:Mat4):Mat4 {
		var a00:Float = a.e[0], a01:Float = a.e[1], a02:Float = a.e[2], a03:Float = a.e[3];
		var a10:Float = a.e[4], a11:Float = a.e[5], a12:Float = a.e[6], a13:Float = a.e[7];
		var a20:Float = a.e[8], a21:Float = a.e[9], a22:Float = a.e[10], a23:Float = a.e[11];
		var a30:Float = a.e[12], a31:Float = a.e[13], a32:Float = a.e[14], a33:Float = a.e[15];

		var b00:Float = b.e[0], b01:Float = b.e[1], b02:Float = b.e[2], b03:Float = b.e[3];
		var b10:Float = b.e[4], b11:Float = b.e[5], b12:Float = b.e[6], b13:Float = b.e[7];
		var b20:Float = b.e[8], b21:Float = b.e[9], b22:Float = b.e[10], b23:Float = b.e[11];
		var b30:Float = b.e[12], b31:Float = b.e[13], b32:Float = b.e[14], b33:Float = b.e[15];

		dest.e[0] = b00*a00 + b01*a10 + b02*a20 + b03*a30;
		dest.e[1] = b00*a01 + b01*a11 + b02*a21 + b03*a31;
		dest.e[2] = b00*a02 + b01*a12 + b02*a22 + b03*a32;
		dest.e[3] = b00*a03 + b01*a13 + b02*a23 + b03*a33;

		dest.e[4] = b10*a00 + b11*a10 + b12*a20 + b13*a30;
		dest.e[5] = b10*a01 + b11*a11 + b12*a21 + b13*a31;
		dest.e[6] = b10*a02 + b11*a12 + b12*a22 + b13*a32;
		dest.e[7] = b10*a03 + b11*a13 + b12*a23 + b13*a33;

		dest.e[8] = b20*a00 + b21*a10 + b22*a20 + b23*a30;
		dest.e[9] = b20*a01 + b21*a11 + b22*a21 + b23*a31;
		dest.e[10] = b20*a02 + b21*a12 + b22*a22 + b23*a32;
		dest.e[11] = b20*a03 + b21*a13 + b22*a23 + b23*a33;

		dest.e[12] = b30*a00 + b31*a10 + b32*a20 + b33*a30;
		dest.e[13] = b30*a01 + b31*a11 + b32*a21 + b33*a31;
		dest.e[14] = b30*a02 + b31*a12 + b32*a22 + b33*a32;
		dest.e[15] = b30*a03 + b31*a13 + b32*a23 + b33*a33;
		return dest;
	}

	/**
	 *  Multiplies a vector `v` by a matrix `m`, storing the result in `dest`. Caches so `v == dest` is valid.
	 *  @param m - The transforming matrix
	 *  @param v - The vector to multiply with
	 *  @param dest - The resulting vector
	 *  @return Vec4
	 */
	public static function multVec(m:Mat4, v:Vec4, dest:Vec4):Vec4 {
		var x:Float = v.x, y:Float = v.y, z:Float = v.z, w:Float = v.w;
		dest.x = m.e[0] * x + m.e[1] * y + m.e[2] * z + m.e[3] * w;
		dest.y = m.e[4] * x + m.e[5] * y + m.e[6] * z + m.e[7] * w;
		dest.z = m.e[8] * x + m.e[9] * y + m.e[10] * z + m.e[11] * w;
		dest.w = m.e[12] * x + m.e[13] * y + m.e[14] * z + m.e[15] * w;
		return dest;
	}
}