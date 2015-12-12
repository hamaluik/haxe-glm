package glm;

/**
 * Utility class for dealing with 3x3 matrices
 */
abstract Mat3(Array<glm.Vec3>) {
	public function new(scale:Float = 0) {
		var arr:Array<glm.Vec3> = [
			new Vec3(scale, 0, 0),
			new Vec3(0, scale, 0),
			new Vec3(0, 0, scale)
		];
		this = arr;
		return cast this;
	}

	/**
	 * Construct a Mat3 from a series of Vec3s (representing rows)
	 * @param  rows<Vec3> the rows
	 * @return            a Mat3
	 */
	public static function fromRowArray(rows:Array<Vec3>):Mat3 {
		if(rows.length != 3) {
			throw "You must supply 3 Vec3s to build a Mat3 this way!";
		}
		var m:Mat3 = new Mat3();
		m[0] = rows[0];
		m[1] = rows[1];
		m[2] = rows[2];
		return m;
	}

	/**
	 * Construct a Mat3 from a series of Vec3s (representing rows)
	 * @param  a row 0
	 * @param  b row 1
	 * @param  c row 2
	 * @return   a Mat3
	 */
	public static function fromRows(a:Vec3, b:Vec3, c:Vec3):Mat3 {
		var m:Mat3 = new Mat3();
		m[0] = a;
		m[1] = b;
		m[2] = c;
		return m;
	}

	/**
	 * Construct a Mat3 from a quaternion
	 * @param  q The quaternion to build from
	 * @return   a new `Mat3`
	 */
	public static function fromQuat(q:Quat):Mat3 {
		var qx2:Float = Math.pow(q.x, 2);
		var qy2:Float = Math.pow(q.y, 2);
		var qz2:Float = Math.pow(q.z, 2);
		var m:Mat3 = Mat3.fromRows(
			new Vec3(1 - 2*qy2 - 2*qz2, 2*q.x*q.y - 2*q.z*q.w, 2*q.x*q.z + 2*q.y*q.w),
			new Vec3(2*q.x*q.y + 2*q.z*q.w, 1 - 2*qx2 - 2*qz2, 2*q.y*q.z - 2*q.x*q.w),
			new Vec3(2*q.x*q.z - 2*q.y*q.w, 2*q.y*q.z + 2*q.x*q.w, 1 - 2*qx2 - 2*qy2)
		);
		return m;
	}

	/**
	 * Makes every element in `this` `=0`
	 * @return `this`
	 */
	public function setZero():Mat3 {
		this[0].zero();
		this[1].zero();
		this[2].zero();
		return cast this;
	}

	/**
	 * Spawns a new mat3 where all elements = 0
	 */
	public static function zero():Mat3 {
		var m:Mat3 = new Mat3();
		m.setZero();
		return m;
	}

	/**
	 * Creates a new Mat3 where the elements exactly equal the elements of `this`
	 */
	public function clone():Mat3 {
		var copy:Mat3 = new Mat3();
		copy[0] = this[0].clone();
		copy[1] = this[1].clone();
		copy[2] = this[2].clone();
		return copy;
	}
	
	/**
	 * Copies the values of m into this matrix
	 * @return `this`
	 */
	public function copy(m:Mat3):Mat3 {
		this[0].copy(m[0]);
		this[1].copy(m[1]);
		this[1].copy(m[2]);
		return this;
	}

	/**
	 * Makes `this` an identity matrix
	 * @return `this`
	 */
	public function setIdentity():Mat3 {
		this[0].set(1, 0, 0);
		this[1].set(0, 1, 0);
		this[2].set(0, 0, 1);
		return cast this;
	}

	/**
	 * Spawns a new mat3 representing an identity matrix
	 */
	public static function identity():Mat3 {
		var m:Mat3 = new Mat3();
		m.setIdentity();
		return m;
	}

	/**
	 * Provides array access in the form of `mat[i]` where `i ∈ [0, 1, 2]`
	 * @return a `Vec3` representing the `i`th row
	 */
	@:arrayAccess public inline function arrayGet(i:Int):Vec3 {
		return this[i];
	}

	/**
	 * Provides array access in the form of `mat[i] = x` where `i ∈ [0, 1, 2]`
	 * @return a `Vec3` representing the `i`th row (which has been set)
	 */
	@:arrayAccess public inline function arraySet(i:Int, x:Vec3):Vec3 {
		return this[i] = x;
	}

	/**
	 * Flattens `this` into [Row-major](https://en.wikipedia.org/wiki/Row-major_order) order
	 */
	public function toArrayRowMajor():Array<Float> {
		return this[0].toArray().concat(
			this[1].toArray().concat(
				this[2].toArray()
			)
		);
	}

	/**
	 * Flattens `this` into [Column-major](https://en.wikipedia.org/wiki/Column-major_order) order
	 */
	public function toArrayColMajor():Array<Float> {
		var ret:Array<Float> = new Array<Float>();
		for(j in 0...3) {
			for(i in 0...3) {
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
	public function multVec3(b:Vec3):Vec3 {
		return new Vec3(
			this[0][0] * b[0] + this[0][1] * b[1] + this[0][2] * b[2],
			this[1][0] * b[0] + this[1][1] * b[1] + this[1][2] * b[2],
			this[2][0] * b[0] + this[2][1] * b[1] + this[2][2] * b[2]
		);
	}

	/**
	 * Allows multiplying matrices and vectors
	 */
	@:op(A * B)
	public static inline function multiplyVec3Op(a:Mat3, b:Vec3):Vec3 {
		return a.multVec3(b);
	}

	/**
	 * Multiplies `b` by `this`
	 * @param  b The mat4 to multiply by
	 * @return   `this` ✕ `b`
	 */
	public inline function multMat3(b:Mat3):Mat3 {
		var rows:Array<Vec3> = [
			this[0][0] * b[0] + this[0][1] * b[1] + this[0][2] * b[2],
			this[1][0] * b[0] + this[1][1] * b[1] + this[1][2] * b[2],
			this[2][0] * b[0] + this[2][1] * b[1] + this[2][2] * b[2]
		];
		this = rows;
		return cast this;
	}

	/**
	 * Allows multiplying two matrices
	 */
	@:op(A * B)
	public static inline function multiplyMat3Op(a:Mat3, b:Mat3):Mat3 {
		return a.multMat3(b);
	}

	/**
	 * Transposes the matrix
	 */
	public inline function transpose():Mat3 {
		var t01 = this[0][1];
		var t02 = this[0][2];
		var t12 = this[1][2];

		this[0][1] = this[1][0];
		this[0][2] = this[2][0];
		this[1][2] = this[2][1];
		this[1][0] = t01;
		this[2][0] = t02;
		this[2][1] = t12;

		return cast this;
	}

	/**
	 * Inverts the matrix (m^-1)
	 * @return The inverse of `this`
	 */
	public inline function invert():Mat3 {
		var det:Float = determinant();
		if(det == 0) {
			return null;
		}
		det = 1.0 / det;

		var t00:Float = this[0][0];
		var t01:Float = this[0][1];
		var t02:Float = this[0][2];
		var t10:Float = this[1][0];
		var t11:Float = this[1][1];
		var t12:Float = this[1][2];
		var t20:Float = this[2][0];
		var t21:Float = this[2][1];
		var t22:Float = this[2][2];

		this[0][0] = (t22 * t11 - t12 * t21) * det;
		this[0][1] = (-t22 * t01 + t02 * t21) * det;
		this[0][2] = (t12 * t01 - t02 * t11) * det;
		this[1][0] = (-t22 * t10 + t12 * t20) * det;
		this[1][1] = (t22 * t00 - t02 * t20) * det;
		this[1][2] = (-t12 * t00 + t02 * t10) * det;
		this[2][0] = (t21 * t10 - t11 * t20) * det;
		this[2][1] = (-t21 * t00 + t01 * t20) * det;
		this[2][2] = (t11 * t00 - t01 * t10) * det;

		return cast this;
	}

	/**
	 * Calculates the determinant of `this`
	 */
	public inline function determinant():Float {
		return this[0][0] * (this[2][2] * this[1][1] - this[1][2] * this[2][1])
			+ this[0][1] * (-this[2][2] * this[1][0] + this[1][2] * this[2][0])
			+ this[0][2] * (this[2][1] * this[1][0] - this[1][1] * this[2][0]);
	}
}