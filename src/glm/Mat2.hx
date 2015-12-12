package glm;

/**
 * Utility class for dealing with 2x2 matrices
 */
abstract Mat2(Array<glm.Vec2>) {
	public function new(scale:Float = 0) {
		var arr:Array<glm.Vec2> = [
			new Vec2(scale, 0),
			new Vec2(0, scale),
		];
		this = arr;
		return cast this;
	}

	/**
	 * Construct a Mat2 from a series of Vec2s (representing rows)
	 * @param  rows<Vec2> the rows
	 * @return            a Mat2
	 */
	public static function fromRowArray(rows:Array<Vec2>):Mat2 {
		if(rows.length != 2) {
			throw "You must supply 2 Vec2s to build a Mat2 this way!";
		}
		var m:Mat2 = new Mat2();
		m[0] = rows[0];
		m[1] = rows[1];
		return m;
	}

	/**
	 * Construct a Mat2 from a series of Vec2s (representing rows)
	 * @param  a row 0
	 * @param  b row 1
	 * @return   a Mat2
	 */
	public static function fromRows(a:Vec2, b:Vec2):Mat2 {
		var m:Mat2 = new Mat2();
		m[0] = a;
		m[1] = b;
		return m;
	}

	/**
	 * Makes every element in `this` `=0`
	 * @return `this`
	 */
	public function setZero():Mat2 {
		this[0].zero();
		this[1].zero();
		return cast this;
	}

	/**
	 * Spawns a new mat2 where all elements = 0
	 */
	public static function zero():Mat2 {
		var m:Mat2 = new Mat2();
		m.setZero();
		return m;
	}

	/**
	 * Creates a new Mat2 where the elements exactly equal the elements of `this`
	 */
	public function clone():Mat2 {
		var copy:Mat2 = new Mat2();
		copy[0] = this[0].clone();
		copy[1] = this[1].clone();
		return copy;
	}
	
	/**
	 * Copies the values of m into this matrix
	 * @return `this`
	 */
	public function copy(m:Mat2):Mat2 {
		this[0].copy(m[0]);
		this[1].copy(m[1]);
		return this;
	}

	/**
	 * Makes `this` an identity matrix
	 * @return `this`
	 */
	public function setIdentity():Mat2 {
		this[0].set(1, 0);
		this[1].set(0, 1);
		return cast this;
	}

	/**
	 * Spawns a new mat3 representing an identity matrix
	 */
	public static function identity():Mat2 {
		var m:Mat2 = new Mat2();
		m.setIdentity();
		return m;
	}

	/**
	 * Provides array access in the form of `mat[i]` where `i ∈ [0, 1, 2]`
	 * @return a `Vec2` representing the `i`th row
	 */
	@:arrayAccess public inline function arrayGet(i:Int):Vec2 {
		return this[i];
	}

	/**
	 * Provides array access in the form of `mat[i] = x` where `i ∈ [0, 1, 2]`
	 * @return a `Vec2` representing the `i`th row (which has been set)
	 */
	@:arrayAccess public inline function arraySet(i:Int, x:Vec2):Vec2 {
		return this[i] = x;
	}

	/**
	 * Flattens `this` into [Row-major](https://en.wikipedia.org/wiki/Row-major_order) order
	 */
	public function toArrayRowMajor():Array<Float> {
		return this[0].toArray().concat(this[1].toArray());
	}

	/**
	 * Flattens `this` into [Column-major](https://en.wikipedia.org/wiki/Column-major_order) order
	 */
	public function toArrayColMajor():Array<Float> {
		var ret:Array<Float> = new Array<Float>();
		for(j in 0...2) {
			for(i in 0...2) {
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
	public function multVec2(b:Vec2):Vec2 {
		return new Vec2(
			this[0][0] * b[0] + this[0][1] * b[1], 
			this[1][0] * b[0] + this[1][1] * b[1]
		);
	}

	/**
	 * Allows multiplying matrices and vectors
	 */
	@:op(A * B)
	public static inline function multiplyVec2Op(a:Mat2, b:Vec2):Vec2 {
		return a.multVec2(b);
	}

	/**
	 * Multiplies `b` by `this`
	 * @param  b The mat4 to multiply by
	 * @return   `this` ✕ `b`
	 */
	public inline function multMat2(b:Mat2):Mat2 {
		var rows:Array<Vec2> = [
			this[0][0] * b[0] + this[0][1] * b[1],
			this[1][0] * b[0] + this[1][1] * b[1]
		];
		this = rows;
		return cast this;
	}

	/**
	 * Allows multiplying two matrices
	 */
	@:op(A * B)
	public static inline function multiplyMat2Op(a:Mat2, b:Mat2):Mat2 {
		return a.multMat2(b);
	}

	/**
	 * Transposes the matrix
	 */
	public inline function transpose():Mat2 {
		var t01:Float = this[0][1];
		this[0][1] = this[1][0];
		this[1][0] = t01;
		return cast this;
	}

	/**
	 * Inverts the matrix (m^-1)
	 * @return The inverse of `this`
	 */
	public inline function invert():Mat2 {
		var det:Float = determinant();
		if(det == 0) {
			return null;
		}
		det = 1.0 / det;

		var t00:Float = this[0][0];

		this[0][0] = this[1][1] * det;
		this[0][1] *= -det;
		this[1][0] *= -det;
		this[1][1] = t00 * det;

		return cast this;
	}

	/**
	 * Calculates the determinant of `this`
	 */
	public inline function determinant():Float {
		return this[0][0] * this[1][1] - this[0][1] * this[1][0];
	}
}