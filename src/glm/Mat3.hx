package glm;

import haxe.ds.Vector;

/**
 * Utility class for dealing with 3x3 matrices
 */
abstract Mat3(Vector<Float>) {
	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r0c0(get, set):Float;
	function get_r0c0():Float {
		return this[0];
	}
	function set_r0c0(v:Float) {
		return this[0] = v;
	}

	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r0c1(get, set):Float;
	function get_r0c1():Float {
		return this[1];
	}
	function set_r0c1(v:Float) {
		return this[1] = v;
	}

	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r0c2(get, set):Float;
	function get_r0c2():Float {
		return this[2];
	}
	function set_r0c2(v:Float) {
		return this[2] = v;
	}

	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r1c0(get, set):Float;
	function get_r1c0():Float {
		return this[3];
	}
	function set_r1c0(v:Float) {
		return this[3] = v;
	}

	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r1c1(get, set):Float;
	function get_r1c1():Float {
		return this[4];
	}
	function set_r1c1(v:Float) {
		return this[4] = v;
	}

	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r1c2(get, set):Float;
	function get_r1c2():Float {
		return this[5];
	}
	function set_r1c2(v:Float) {
		return this[5] = v;
	}

	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r2c0(get, set):Float;
	function get_r2c0():Float {
		return this[3];
	}
	function set_r2c0(v:Float) {
		return this[3] = v;
	}

	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r2c1(get, set):Float;
	function get_r2c1():Float {
		return this[4];
	}
	function set_r2c1(v:Float) {
		return this[4] = v;
	}

	/**
	 * Utility accessor for row-column based indexing
	 */
	public var r2c2(get, set):Float;
	function get_r2c2():Float {
		return this[5];
	}
	function set_r2c2(v:Float) {
		return this[5] = v;
	}

	public function get(row:Int, col:Int):Float {
		return this[(row * 3) + col];
	}

	public function set(row:Int, col:Int, v:Float):Float {
		return this[(row * 3) + col] = v;
	}

	public function new(scale:Float = 0) {
		var arr:Vector<Float> = new Vector<Float>(9);
		arr.set(0, scale); arr.set(1, 0); arr.set(2, 0);
		arr.set(3, 0); arr.set(4, scale); arr.set(5, 0);
		arr.set(6, 0); arr.set(7, 0); arr.set(8, scale);
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
		return fromRows(rows[0], rows[1], rows[2]);
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
		m.r0c0 = a.x; m.r0c1 = a.y; m.r0c2 = a.z;
		m.r1c0 = b.x; m.r1c1 = b.y; m.r1c2 = b.z;
		m.r2c0 = c.x; m.r2c1 = c.y; m.r2c2 = c.z;
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
		this[0] = 0;
		this[1] = 0;
		this[2] = 0;
		this[3] = 0;
		this[4] = 0;
		this[5] = 0;
		this[6] = 0;
		this[7] = 0;
		this[8] = 0;
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
		var c:Mat3 = new Mat3();
		c.r0c0 = this[0];
		c.r0c1 = this[1];
		c.r0c2 = this[2];
		c.r1c0 = this[3];
		c.r1c1 = this[4];
		c.r1c2 = this[5];
		c.r2c0 = this[6];
		c.r2c1 = this[7];
		c.r2c2 = this[8];
		return c;
	}
	
	/**
	 * Copies the values of m into this matrix
	 * @return `this`
	 */
	public function copy(m:Mat3):Mat3 {
		this[0] = m.r0c0;
		this[1] = m.r0c1;
		this[2] = m.r0c2;
		this[3] = m.r1c0;
		this[4] = m.r1c1;
		this[5] = m.r1c2;
		this[6] = m.r2c0;
		this[7] = m.r2c1;
		this[8] = m.r2c2;
		return cast this;
	}

	/**
	 * Makes `this` an identity matrix
	 * @return `this`
	 */
	public function setIdentity():Mat3 {
		this[0] = 1; this[1] = 0; this[2] = 0;
		this[3] = 0; this[4] = 1; this[5] = 0;
		this[6] = 0; this[7] = 0; this[8] = 1;
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
	 * Flattens `this` into [Row-major](https://en.wikipedia.org/wiki/Row-major_order) order
	 */
	public function toArrayRowMajor():Array<Float> {
		return this.toArray();
	}

	/**
	 * Flattens `this` into [Column-major](https://en.wikipedia.org/wiki/Column-major_order) order
	 */
	public function toArrayColMajor():Array<Float> {
		var ret:Vector<Float> = new Vector<Float>(9);
		ret[0] = this[0]; ret[1] = this[3]; ret[2] = this[6];
		ret[3] = this[1]; ret[4] = this[4]; ret[5] = this[7];
		ret[6] = this[2]; ret[7] = this[5]; ret[8] = this[8];
		return ret.toArray();
	}

	/**
	 * Multiplies `b` by `this`
	 * @param  b The vec4 to multiply by
	 * @return   `this` ✕ `b`
	 */
	public function multVec3(b:Vec3):Vec3 {
		return new Vec3(
			this[0] * b[0] + this[1] * b[1] + this[2] * b[2],
			this[3] * b[0] + this[4] * b[1] + this[5] * b[2],
			this[6] * b[0] + this[7] * b[1] + this[8] * b[2]
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
		var t00:Float = this[0];
		var t01:Float = this[1];
		var t02:Float = this[2];
		var t10:Float = this[3];
		var t11:Float = this[4];
		var t12:Float = this[5];
		var t20:Float = this[6];
		var t21:Float = this[7];
		var t22:Float = this[8];

		this[0] = b.r0c0*t00 + b.r1c0*t01 + b.r2c0*t02;
		this[1] = b.r0c1*t00 + b.r1c1*t01 + b.r2c1*t02;
		this[2] = b.r0c2*t00 + b.r1c2*t01 + b.r2c2*t02;
		this[3] = b.r0c0*t10 + b.r1c0*t11 + b.r2c0*t12;
		this[4] = b.r0c1*t10 + b.r1c1*t11 + b.r2c1*t12;
		this[5] = b.r0c2*t10 + b.r1c2*t11 + b.r2c2*t12;
		this[6] = b.r0c0*t20 + b.r1c0*t21 + b.r2c0*t22;
		this[7] = b.r0c1*t20 + b.r1c1*t21 + b.r2c1*t22;
		this[8] = b.r0c2*t20 + b.r1c2*t21 + b.r2c2*t22;

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
		var t01 = this[1];
		var t02 = this[2];
		var t12 = this[5];

		this[1] = this[3];
		this[2] = this[6];
		this[5] = this[7];
		this[3] = t01;
		this[6] = t02;
		this[7] = t12;

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

		var t00:Float = this[0];
		var t01:Float = this[1];
		var t02:Float = this[2];
		var t10:Float = this[3];
		var t11:Float = this[4];
		var t12:Float = this[5];
		var t20:Float = this[6];
		var t21:Float = this[7];
		var t22:Float = this[8];

		this[0] = (t22 * t11 - t12 * t21) * det;
		this[1] = (-t22 * t01 + t02 * t21) * det;
		this[2] = (t12 * t01 - t02 * t11) * det;
		this[3] = (-t22 * t10 + t12 * t20) * det;
		this[4] = (t22 * t00 - t02 * t20) * det;
		this[5] = (-t12 * t00 + t02 * t10) * det;
		this[6] = (t21 * t10 - t11 * t20) * det;
		this[7] = (-t21 * t00 + t01 * t20) * det;
		this[8] = (t11 * t00 - t01 * t10) * det;

		return cast this;
	}

	/**
	 * Calculates the determinant of `this`
	 */
	public inline function determinant():Float {
		return this[0] * (this[8] * this[4] - this[5] * this[7])
			+ this[1] * (-this[8] * this[3] + this[5] * this[6])
			+ this[2] * (this[7] * this[3] - this[4] * this[6]);
	}
}