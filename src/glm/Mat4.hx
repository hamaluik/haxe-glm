package glm;

/**
 * Utility class for dealing with 4x4 matrices
 */
abstract Mat4(Array<glm.Vec4>) {
	public function new(scale:Float = 1) {
		this = [
			new Vec4(scale, 0, 0, 0),
			new Vec4(0, scale, 0, 0),
			new Vec4(0, 0, scale, 0),
			new Vec4(0, 0, 0, scale)
		];
	}

	inline public function fromColArray(cols:Array<Vec4>):Mat4 {
		if(cols.length != 4) {
			throw "You must supply 4 Vec4s to build a Mat4 this way!";
		}
		this = cols;
		return cast this;
	}

	inline public function fromCols(a:Vec4, b:Vec4, c:Vec4, d:Vec4):Mat4 {
		this = [
			a, b, c, d
		];
		return cast this;
	}

	public function zero():Mat4 {
		this[0].zero();
		this[1].zero();
		this[2].zero();
		this[3].zero();
		return cast this;
	}

	public function clone():Mat4 {
		var copy:Mat4 = new Mat4();
		copy[0] = this[0];
		copy[1] = this[1];
		copy[2] = this[2];
		copy[3] = this[3];
		return copy;
	}

	public function identity():Mat4 {
		this[0].set(1, 0, 0, 0);
		this[1].set(0, 1, 0, 0);
		this[2].set(0, 0, 1, 0);
		this[3].set(0, 0, 0, 1);
		return cast this;
	}

	@:arrayAccess public inline function arrayGet(i:Int):Vec4 {
		return this[i];
	}

	@:arrayAccess public inline function arraySet(i:Int, x:Vec4):Vec4 {
		return this[i] = x;
	}

	public function toArray():Array<Float> {
		return this[0].toArray().concat(
			this[1].toArray().concat(
				this[2].toArray().concat(
					this[3].toArray()
				)
			)
		);
	}

	/**
	 * Multiplies `b` by `this`
	 * @param  b The vec4 to multiply by
	 * @return   `this` ✕ `b`
	 */
	public function multVec4(b:Vec4):Vec4 {
		return new Vec4(
			this[0][0] * b[0] + this[1][0] * b[1] + this[2][0] * b[2] + this[3][0] * b[3],
			this[0][1] * b[0] + this[1][1] * b[1] + this[2][1] * b[2] + this[3][1] * b[3],
			this[0][2] * b[0] + this[1][2] * b[1] + this[2][2] * b[2] + this[3][2] * b[3],
			this[0][3] * b[0] + this[1][3] * b[1] + this[2][3] * b[2] + this[3][3] * b[3]
		);
	}

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
		var cols:Array<Vec4> = [
			this[0][0] * b[0] + this[1][0] * b[1] + this[2][0] * b[2] + this[3][0] * b[3],
			this[0][1] * b[0] + this[1][1] * b[1] + this[2][1] * b[2] + this[3][1] * b[3],
			this[0][2] * b[0] + this[1][2] * b[1] + this[2][2] * b[2] + this[3][2] * b[3],
			this[0][3] * b[0] + this[1][3] * b[1] + this[2][3] * b[2] + this[3][3] * b[3]
		];
		this = cols;
		return cast this;
	}

	@:op(A * B)
	public static inline function multiplyMat4Op(a:Mat4, b:Mat4):Mat4 {
		return a.multMat4(b);
	}
}