package glm;

/**
 * Utility class for dealing with 4x4 matrices
 */
abstract Mat4(Array<glm.Vec4>) {
	public function new(scale:Float = 0) {
		var arr:Array<glm.Vec4> = [
			new Vec4(scale, 0, 0, 0),
			new Vec4(0, scale, 0, 0),
			new Vec4(0, 0, scale, 0),
			new Vec4(0, 0, 0, scale)
		];
		this = arr;
		return cast this;
	}

	/**
	 * Construct a Mat4 from a series of Vec4s (representing rows)
	 * @param  rows<Vec4> the rows
	 * @return            a Mat4
	 */
	public static function fromRowArray(rows:Array<Vec4>):Mat4 {
		if(rows.length != 4) {
			throw "You must supply 4 Vec4s to build a Mat4 this way!";
		}
		var m:Mat4 = new Mat4();
		m[0] = rows[0];
		m[1] = rows[1];
		m[2] = rows[2];
		m[3] = rows[3];
		return m;
	}

	/**
	 * Construct a Mat4 from a series of Vec4s (representing rows)
	 * @param  a row 0
	 * @param  b row 1
	 * @param  c row 2
	 * @param  d row 3
	 * @return   a Mat4
	 */
	public static function fromRows(a:Vec4, b:Vec4, c:Vec4, d:Vec4):Mat4 {
		var m:Mat4 = new Mat4();
		m[0] = a;
		m[1] = b;
		m[2] = c;
		m[3] = d;
		return m;
	}

	/**
	 * Makes every element in `this` `=0`
	 * @return `this`
	 */
	public function setZero():Mat4 {
		this[0].zero();
		this[1].zero();
		this[2].zero();
		this[3].zero();
		return cast this;
	}

	/**
	 * Spawns a new mat4 where all elements = 0
	 */
	public static function zero():Mat4 {
		var m:Mat4 = new Mat4();
		m.setZero();
		return m;
	}

	/**
	 * Creates a new Mat4 where the elements exactly equal the elements of `this`
	 */
	public function clone():Mat4 {
		var copy:Mat4 = new Mat4();
		copy[0] = this[0].clone();
		copy[1] = this[1].clone();
		copy[2] = this[2].clone();
		copy[3] = this[3].clone();
		return copy;
	}

	/**
	 * Makes `this` an identity matrix
	 * @return `this`
	 */
	public function setIdentity():Mat4 {
		this[0].set(1, 0, 0, 0);
		this[1].set(0, 1, 0, 0);
		this[2].set(0, 0, 1, 0);
		this[3].set(0, 0, 0, 1);
		return cast this;
	}

	/**
	 * Spawns a new mat4 representing an identity matrix
	 */
	public static function identity():Mat4 {
		var m:Mat4 = new Mat4();
		m.setIdentity();
		return m;
	}

	/**
	 * Provides array access in the form of `mat[i]` where `i ∈ [0, 1, 2, 3]`
	 * @return a `Vec4` representing the `i`th row
	 */
	@:arrayAccess public inline function arrayGet(i:Int):Vec4 {
		return this[i];
	}

	/**
	 * Provides array access in the form of `mat[i] = x` where `i ∈ [0, 1, 2, 3]`
	 * @return a `Vec4` representing the `i`th row (which has been set)
	 */
	@:arrayAccess public inline function arraySet(i:Int, x:Vec4):Vec4 {
		return this[i] = x;
	}

	/**
	 * Flattens `this` into [Row-major](https://en.wikipedia.org/wiki/Row-major_order) order
	 */
	public function toArrayRowMajor():Array<Float> {
		return this[0].toArray().concat(
			this[1].toArray().concat(
				this[2].toArray().concat(
					this[3].toArray()
				)
			)
		);
	}

	/**
	 * Flattens `this` into [Column-major](https://en.wikipedia.org/wiki/Column-major_order) order
	 */
	public function toArrayColMajor():Array<Float> {
		var ret:Array<Float> = new Array<Float>();
		for(j in 0...4) {
			for(i in 0...4) {
				ret.push(this[i][j]);
			}
		}
		return ret;
	}

	/**
	 * Multiplies `b` by `this`
	 * @param  b The vec4 to multiply by
	 * @return   `this` ✕ `b`
	 */
	public function multVec4(b:Vec4):Vec4 {
		return new Vec4(
			this[0][0] * b[0] + this[0][1] * b[1] + this[0][2] * b[2] + this[0][3] * b[3],
			this[1][0] * b[0] + this[1][1] * b[1] + this[1][2] * b[2] + this[1][3] * b[3],
			this[2][0] * b[0] + this[2][1] * b[1] + this[2][2] * b[2] + this[2][3] * b[3],
			this[3][0] * b[0] + this[3][1] * b[1] + this[3][2] * b[2] + this[3][3] * b[3]
		);
	}

	/**
	 * Allows multiplying matrices and vectors
	 */
	@:op(A * B)
	public static inline function multiplyVec4Op(a:Mat4, b:Vec4):Vec4 {
		return a.multVec4(b);
	}

	/**
	 * Multiplies `b` by `this`
	 * @param  b The mat4 to multiply by
	 * @return   `this` ✕ `b`
	 */
	public inline function multMat4(b:Mat4):Mat4 {
		var rows:Array<Vec4> = [
			this[0][0] * b[0] + this[0][1] * b[1] + this[0][2] * b[2] + this[0][3] * b[3],
			this[1][0] * b[0] + this[1][1] * b[1] + this[1][2] * b[2] + this[1][3] * b[3],
			this[2][0] * b[0] + this[2][1] * b[1] + this[2][2] * b[2] + this[2][3] * b[3],
			this[3][0] * b[0] + this[3][1] * b[1] + this[3][2] * b[2] + this[3][3] * b[3]
		];
		this = rows;
		return cast this;
	}

	/**
	 * Allows multiplying two matrices
	 */
	@:op(A * B)
	public static inline function multiplyMat4Op(a:Mat4, b:Mat4):Mat4 {
		return a.multMat4(b);
	}

	/**
	 * Transposes the matrix
	 */
	public inline function transpose():Mat4 {
		var t01 = this[0][1];
		var t02 = this[0][2];
		var t03 = this[0][3];
		var t12 = this[1][2];
		var t13 = this[1][3];
		var t23 = this[2][3];

		this[0][1] = this[1][0];
		this[0][2] = this[2][0];
		this[0][3] = this[3][0];
		this[1][2] = this[2][1];
		this[1][3] = this[3][1];
		this[2][3] = this[3][2];
		this[1][0] = t01;
		this[2][0] = t02;
		this[3][0] = t03;
		this[2][1] = t12;
		this[3][1] = t13;
		this[3][2] = t23;

		return cast this;
	}

	/**
	 * Inverts the matrix (m^-1)
	 * @return The inverse of `this`
	 */
	public inline function invert():Mat4 {
		var det:Float = determinant();
		if(det == 0) {
			return null;
		}
		det = 1.0 / det;

		var t00:Float = this[0][0];
		var t01:Float = this[0][1];
		var t02:Float = this[0][2];
		var t03:Float = this[0][3];
		var t10:Float = this[1][0];
		var t11:Float = this[1][1];
		var t12:Float = this[1][2];
		var t13:Float = this[1][3];
		var t20:Float = this[2][0];
		var t21:Float = this[2][1];
		var t22:Float = this[2][2];
		var t23:Float = this[2][3];
		var t30:Float = this[3][0];
		var t31:Float = this[3][1];
		var t32:Float = this[3][2];
		var t33:Float = this[3][3];

		var b00 = t00 * t11 - t01 * t10;
		var b01 = t00 * t12 - t02 * t10;
		var b02 = t00 * t13 - t03 * t10;
		var b03 = t01 * t12 - t02 * t11;
		var b04 = t01 * t13 - t03 * t11;
		var b05 = t02 * t13 - t03 * t12;
		var b06 = t20 * t31 - t21 * t30;
		var b07 = t20 * t32 - t22 * t30;
		var b08 = t20 * t33 - t23 * t30;
		var b09 = t21 * t32 - t22 * t31;
		var b10 = t21 * t33 - t23 * t31;
		var b11 = t22 * t33 - t23 * t32;

		this[0][0] = (t11 * b11 - t12 * b10 + t13 * b09) * det;
		this[0][1] = (t02 * b10 - t01 * b11 - t03 * b09) * det;
		this[0][2] = (t31 * b05 - t32 * b04 + t33 * b03) * det;
		this[0][3] = (t22 * b04 - t21 * b05 - t23 * b03) * det;
		this[1][0] = (t12 * b08 - t10 * b11 - t13 * b07) * det;
		this[1][1] = (t00 * b11 - t02 * b08 + t03 * b07) * det;
		this[1][2] = (t32 * b02 - t30 * b05 - t33 * b01) * det;
		this[1][3] = (t20 * b05 - t22 * b02 + t23 * b01) * det;
		this[2][0] = (t10 * b10 - t11 * b08 + t13 * b06) * det;
		this[2][1] = (t01 * b08 - t00 * b10 - t03 * b06) * det;
		this[2][2] = (t30 * b04 - t31 * b02 + t33 * b00) * det;
		this[2][3] = (t21 * b02 - t20 * b04 - t23 * b00) * det;
		this[3][0] = (t11 * b07 - t10 * b09 - t12 * b06) * det;
		this[3][1] = (t00 * b09 - t01 * b07 + t02 * b06) * det;
		this[3][2] = (t31 * b01 - t30 * b03 - t32 * b00) * det;
		this[3][3] = (t20 * b03 - t21 * b01 + t22 * b00) * det;

		return cast this;
	}

	/**
	 * Calculates the determinant of `this`
	 */
	public inline function determinant():Float {
		var b00:Float = this[0][0] * this[1][1] - this[0][1] * this[1][0];
		var b01:Float = this[0][0] * this[1][2] - this[0][2] * this[1][0];
		var b02:Float = this[0][0] * this[1][3] - this[0][3] * this[1][0];
		var b03:Float = this[0][1] * this[1][2] - this[0][2] * this[1][1];
		var b04:Float = this[0][1] * this[1][3] - this[0][3] * this[1][1];
		var b05:Float = this[0][2] * this[1][3] - this[0][3] * this[1][2];
		var b06:Float = this[2][0] * this[3][1] - this[2][1] * this[3][0];
		var b07:Float = this[2][0] * this[3][2] - this[2][2] * this[3][0];
		var b08:Float = this[2][0] * this[3][3] - this[2][3] * this[3][0];
		var b09:Float = this[2][1] * this[3][2] - this[2][2] * this[3][1];
		var b10:Float = this[2][1] * this[3][3] - this[2][3] * this[3][1];
		var b11:Float = this[2][2] * this[3][3] - this[2][3] * this[3][2];
		return b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;
	}

	/**
	 * Converts a quaternion into a transform matrix
	 * @param  q The quaternion to transform
	 * @return   A matrix which is equivalent to the quaternion
	 */
	public static inline function fromQuat(q:Quat):Mat4 {
		return Mat4.zero();
	}

	/**
	 * Converts from Mat3s to Mat4s using standard casting
	 */
	@:from
	public static inline function fromMat3(v:Mat3):Mat4 {
		var r:Mat4 = Mat4.fromRows(
			new Vec4(v[0][0], v[0][1], v[0][2], 0),
			new Vec4(v[1][0], v[1][1], v[1][2], 0),
			new Vec4(v[2][0], v[2][1], v[2][2], 0),
			new Vec4(0, 0, 0, 1)
		);
		return r;
	}
}