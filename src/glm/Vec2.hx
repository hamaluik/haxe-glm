package glm;

/**
 * Utility class for dealing with 2D vectors
 */
abstract Vec2(Array<Float>) {
	/**
	 * Utility accessor for the first element
	 */
	public var x(get, set):Float;
	function get_x():Float {
		return this[0];
	}
	function set_x(v:Float) {
		return this[0] = v;
	}

	/**
	 * Utility accessor for the second element
	 */
	public var y(get, set):Float;
	function get_y():Float {
		return this[1];
	}
	function set_y(v:Float) {
		return this[1] = v;
	}

	/**
	 * Utility accessor for the first element
	 */
	public var s(get, set):Float;
	function get_s():Float {
		return this[0];
	}
	function set_s(v:Float) {
		return this[0] = v;
	}

	/**
	 * Utility accessor for the second element
	 */
	public var t(get, set):Float;
	function get_t():Float {
		return this[1];
	}
	function set_t(v:Float) {
		return this[1] = v;
	}

	public function new(x:Float=0, y:Float=0) {
		var arr:Array<Float> = new Array<Float>();
		arr.push(x);
		arr.push(y);
		this = arr;
	}

	/**
	 * Utility function to set the components
	 */
	public function set(?x:Float, ?y:Float):Vec2 {
		if(x != null) this[0] = x;
		if(y != null) this[1] = y;
		return cast this;
	}

	/**
	 * Sets all the values to be 0
	 * @return `this`
	 */
	public function zero():Vec2 {
		this[0] = 0;
		this[1] = 0;
		return cast this;
	}

	/**
	 * Calculates the square of the L2-norm of the vector, `sqrt` it to get the length.
	 * @return `x^2 + y^2`
	 */
	public function sqrLength():Float {
		return (this[0] * this[0]) + (this[1] * this[1]);
	}

	/**
	 * Calculates the L2-norm of the vector
	 * @return The length (magnitude) of the vector
	 */
	public function length():Float {
		return Math.sqrt(sqrLength());
	}

	/**
	 * Normalizes the vector such that its `length == 1` while maintaining direction
	 * @return `this`, normalized
	 */
	public function normalize():Vec2 {
		var l:Float = length();
		if(l != 0) {
			this[0] /= l;
			this[1] /= l;
		}
		else {
			zero();
		}
		return cast this;
	}

	/**
	 * Photocopies `this`
	 * @return A new `Vec2` who's elements are the same as `this`
	 */
	public function clone():Vec2 {
		var copy:Vec2 = new Vec2();
		copy[0] = this[0];
		copy[1] = this[1];
		return copy;
	}
	
	/**
	 * Copies the values of `v` into `this`
	 * @param v The vector to copy from
	 * @return `this`
	 */
	public function copy(v:Vec2):Vec2 {
		this[0] = v[0];
		this[1] = v[1];
		return cast this;
	}

	/**
	 * Element-based addition
	 * @param  b The vector to add to `this`
	 * @return   `this.x + b.x`, etc
	 */
	public function addVec2(b:Vec2):Vec2 {
		this[0] += b[0];
		this[1] += b[1];
		return cast this;
	}

	/**
	 * Allows adding two vectors together
	 */
	@:op(A + B)
	public static inline function addVec2Op(a:Vec2, b:Vec2):Vec2 {
		return a.clone().addVec2(b);
	}

	/**
	 * Element-based subtraction
	 * @param  b The vector to subtract from `this`
	 * @return   `this.x - b.x`, etc
	 */
	public function subtractVec2(b:Vec2):Vec2 {
		this[0] -= b[0];
		this[1] -= b[1];
		return cast this;
	}

	/**
	 * Allows subtracting two vectors
	 */
	@:op(A - B)
	public static inline function subtractVec2Op(a:Vec2, b:Vec2):Vec2 {
		return a.clone().subtractVec2(b);
	}

	/**
	 * Add a scalar to this
	 * @param  b The scalar to add
	 * @return   `b` added to `this`
	 */
	public function addScalar(b:Float):Vec2 {
		this[0] += b;
		this[1] += b;
		return cast this;
	}

	/**
	 * Allows adding by a scalar (`this + 4.2`)
	 */
	@:op(A + B)
	public static inline function addScalarOp(a:Vec2, b:Float):Vec2 {
		return a.clone().addScalar(b);
	}

	/**
	 * Allows adding by a scalar (`4.2 + this`)
	 */
	@:op(A + B)
	public static inline function addScalarOp2(b:Float, a:Vec2):Vec2 {
		return a.clone().addScalar(b);
	}

	/**
	 * Subtract a scalar from this
	 * @param  b The scalar to subtract
	 * @return   `b` subtracted from `this`
	 */
	public function subtractScalar(b:Float):Vec2 {
		this[0] -= b;
		this[1] -= b;
		return cast this;
	}

	/**
	 * Allows subtracting by a scalar (`this + 4.2`)
	 */
	@:op(A - B)
	public static inline function subtractScalarOp(a:Vec2, b:Float):Vec2 {
		return a.clone().subtractScalar(b);
	}

	/**
	 * Allows subtracting by a scalar (`4.2 + this`)
	 */
	@:op(A - B)
	public static inline function subtractScalarOp2(a:Float, b:Vec2):Vec2 {
		return b.clone().multiplyScalar(-1).addScalar(a);
	}

	/**
	 * Mutliply this by a scalar
	 * @param  b The scalar to multiply by
	 * @return   `this`, scaled by `b`
	 */
	public function multiplyScalar(b:Float):Vec2 {
		this[0] *= b;
		this[1] *= b;
		return cast this;
	}

	/**
	 * Allows multiplying by a scalar (`this * 4.2`)
	 */
	@:op(A * B)
	public static inline function multiplyScalarOp(a:Vec2, b:Float):Vec2 {
		return a.clone().multiplyScalar(b);
	}

	/**
	 * Allows multiplying by a scalar (`4.2 * this`)
	 */
	@:op(A * B)
	public static inline function multiplyScalarOp2(b:Float, a:Vec2):Vec2 {
		return a.clone().multiplyScalar(b);
	}

	/**
	 * Dividy this by a scalar
	 * @param  b The scalar to divide by
	 * @return   `this`, divided by `b`
	 */
	public function divideScalar(b:Float):Vec2 {
		this[0] /= b;
		this[1] /= b;
		return cast this;
	}

	/**
	 * Allows dividing by a scalar (`this / 4.2`)
	 */
	@:op(A / B)
	public static inline function divideScalarOp(a:Vec2, b:Float):Vec2 {
		return a.clone().divideScalar(b);
	}

	/**
	 * Provides array access in the form of `vec[i]` where `i ∈ [0, 1]`
	 */
	@:arrayAccess public inline function arrayGet(i:Int):Float {
		return this[i];
	}

	/**
	 * Provides array access in the form of `vec[i] = x` where `i ∈ [0, 1]`
	 */
	@:arrayAccess public inline function arraySet(i:Int, x:Float):Float {
		return this[i] = x;
	}

	/**
	 * Converts `this` to an array of floats
	 * @return `this`
	 */
	public inline function toArray():Array<Float> {
		return this;
	}

	/**
	 * Linearly interpolate `this` from its current value to the target
	 * @param  target The target endpoint
	 * @param  t      a number in the range `[0, 1]` which describes how far
	 *                along to interpolate.
	 * @return        `this`
	 */
	public inline function lerp(target:Vec2, t:Float):Vec2 {
		this[0] = GLM.lerp(this[0], target[0], t);
		this[1] = GLM.lerp(this[1], target[1], t);
		return cast this;
	}

	/**
	 * Calculates the dot product between two Vec2s
	 */
	public static inline function dot(a:Vec2, b:Vec2):Float {
		return (a[0] * b[0]) + (a[1] * b[1]);
	}

	/**
	 * Converts from Vec3s to Vec2s using standard casting
	 */
	@:from
	public static inline function fromVec3(v:Vec3):Vec2 {
		return new Vec2(v.x, v.y);
	}

	/**
	 * Converts from Vec4s to Vec2s using standard casting
	 */
	@:from
	public static inline function fromVec4(v:Vec4):Vec2 {
		return new Vec2(v.x, v.y);
	}
}