package glm;

/**
 * Utility class for dealing with 3D vectors
 */
abstract Vec3(Array<Float>) {
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
	 * Utility accessor for the third element
	 */
	public var z(get, set):Float;
	function get_z():Float {
		return this[2];
	}
	function set_z(v:Float) {
		return this[2] = v;
	}

	/**
	 * Utility accessor for the first element
	 */
	public var r(get, set):Float;
	function get_r():Float {
		return this[0];
	}
	function set_r(v:Float) {
		return this[0] = v;
	}


	/**
	 * Utility accessor for the second element
	 */
	public var g(get, set):Float;
	function get_g():Float {
		return this[1];
	}
	function set_g(v:Float) {
		return this[1] = v;
	}
	
	/**
	 * Utility accessor for the third element
	 */
	public var b(get, set):Float;
	function get_b():Float {
		return this[2];
	}
	function set_b(v:Float) {
		return this[2] = v;
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

	/**
	 * Utility accessor for the third element
	 */
	public var p(get, set):Float;
	function get_p():Float {
		return this[2];
	}
	function set_p(v:Float) {
		return this[2] = v;
	}

	public function new(x:Float=0, y:Float=0, z:Float=0) {
		var arr:Array<Float> = new Array<Float>();
		arr.push(x);
		arr.push(y);
		arr.push(z);
		this = arr;
	}

	/**
	 * Utility function to set the components
	 */
	public function set(?x:Float, ?y:Float, ?z:Float):Vec3 {
		if(x != null) this[0] = x;
		if(y != null) this[1] = y;
		if(z != null) this[2] = z;
		return cast this;
	}

	/**
	 * Sets all the values to be 0
	 * @return `this`
	 */
	public function zero():Vec3 {
		this[0] = 0;
		this[1] = 0;
		this[2] = 0;
		return cast this;
	}

	/**
	 * Calculates the square of the L2-norm of the vector, `sqrt` it to get the length.
	 * @return `x^2 + y^2 + z^2`
	 */
	public function sqrLength():Float {
		return (this[0] * this[0]) + (this[1] * this[1]) + (this[2] * this[2]);
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
	public function normalize():Vec3 {
		var l:Float = length();
		if(l != 0) {
			this[0] /= l;
			this[1] /= l;
			this[2] /= l;
		}
		else {
			zero();
		}
		return cast this;
	}

	/**
	 * Photocopies `this`
	 * @return A new `Vec3` who's elements are the same as `this`
	 */
	public function clone():Vec3 {
		var copy:Vec3 = new Vec3();
		copy[0] = this[0];
		copy[1] = this[1];
		copy[2] = this[2];
		return copy;
	}
	
	/**
	 * Copies the values of `v` into `this`
	 * @param v The vector to copy from
	 * @return `this`
	 */
	public function copy(v:Vec3):Vec3 {
		this[0] = v[0];
		this[1] = v[1];
		this[2] = v[2];
		return cast this;
	}

	/**
	 * Element-based addition
	 * @param  b The vector to add to `this`
	 * @return   `this.x + b.x`, etc
	 */
	public function addVec3(b:Vec3):Vec3 {
		this[0] += b[0];
		this[1] += b[1];
		this[2] += b[2];
		return cast this;
	}

	/**
	 * Allows adding two vectors together
	 */
	@:op(A + B)
	public static inline function addVec3Op(a:Vec3, b:Vec3):Vec3 {
		return a.clone().addVec3(b);
	}

	/**
	 * Element-based subtraction
	 * @param  b The vector to subtract from `this`
	 * @return   `this.x - b.x`, etc
	 */
	public function subtractVec3(b:Vec3):Vec3 {
		this[0] -= b[0];
		this[1] -= b[1];
		this[2] -= b[2];
		return cast this;
	}

	/**
	 * Allows subtracting two vectors
	 */
	@:op(A - B)
	public static inline function subtractVec3Op(a:Vec3, b:Vec3):Vec3 {
		return a.clone().subtractVec3(b);
	}

	/**
	 * Add a scalar to this
	 * @param  b The scalar to add
	 * @return   `b` added to `this`
	 */
	public function addScalar(b:Float):Vec3 {
		this[0] += b;
		this[1] += b;
		this[2] += b;
		return cast this;
	}

	/**
	 * Allows adding by a scalar (`this + 4.2`)
	 */
	@:op(A + B)
	public static inline function addScalarOp(a:Vec3, b:Float):Vec3 {
		return a.clone().addScalar(b);
	}

	/**
	 * Allows adding by a scalar (`4.2 + this`)
	 */
	@:op(A + B)
	public static inline function addScalarOp2(b:Float, a:Vec3):Vec3 {
		return a.clone().addScalar(b);
	}

	/**
	 * Subtract a scalar from this
	 * @param  b The scalar to subtract
	 * @return   `b` subtracted from `this`
	 */
	public function subtractScalar(b:Float):Vec3 {
		this[0] -= b;
		this[1] -= b;
		this[2] -= b;
		return cast this;
	}

	/**
	 * Allows subtracting by a scalar (`this + 4.2`)
	 */
	@:op(A - B)
	public static inline function subtractScalarOp(a:Vec3, b:Float):Vec3 {
		return a.clone().subtractScalar(b);
	}

	/**
	 * Allows subtracting by a scalar (`4.2 + this`)
	 */
	@:op(A - B)
	public static inline function subtractScalarOp2(a:Float, b:Vec3):Vec3 {
		return b.clone().multiplyScalar(-1).addScalar(a);
	}

	/**
	 * Mutliply this by a scalar
	 * @param  b The scalar to multiply by
	 * @return   `this`, scaled by `b`
	 */
	public function multiplyScalar(b:Float):Vec3 {
		this[0] *= b;
		this[1] *= b;
		this[2] *= b;
		return cast this;
	}

	/**
	 * Allows multiplying by a scalar (`this * 4.2`)
	 */
	@:op(A * B)
	public static inline function multiplyScalarOp(a:Vec3, b:Float):Vec3 {
		return a.clone().multiplyScalar(b);
	}

	/**
	 * Allows multiplying by a scalar (`4.2 * this`)
	 */
	@:op(A * B)
	public static inline function multiplyScalarOp2(b:Float, a:Vec3):Vec3 {
		return a.clone().multiplyScalar(b);
	}

	/**
	 * Dividy this by a scalar
	 * @param  b The scalar to divide by
	 * @return   `this`, divided by `b`
	 */
	public function divideScalar(b:Float):Vec3 {
		this[0] /= b;
		this[1] /= b;
		this[2] /= b;
		return cast this;
	}

	/**
	 * Allows dividing by a scalar (`this / 4.2`)
	 */
	@:op(A / B)
	public static inline function divideScalarOp(a:Vec3, b:Float):Vec3 {
		return a.clone().divideScalar(b);
	}

	/**
	 * Provides array access in the form of `vec[i]` where `i ∈ [0, 1, 2]`
	 */
	@:arrayAccess public inline function arrayGet(i:Int):Float {
		return this[i];
	}

	/**
	 * Provides array access in the form of `vec[i] = x` where `i ∈ [0, 1, 2]`
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
	public inline function lerp(target:Vec3, t:Float):Vec3 {
		this[0] = GLM.lerp(this[0], target[0], t);
		this[1] = GLM.lerp(this[1], target[1], t);
		this[2] = GLM.lerp(this[2], target[2], t);
		return cast this;
	}

	/**
	 * Up-converts `this` to a Vec4 by padding the `w` component
	 * of the result to be `0`
	 */
	public inline function toVec4():Vec4 {
		return new Vec4(x, y, z, 0);
	}

	/**
	 * Calculates the dot product between two Vec3s
	 */
	public static inline function dot(a:Vec3, b:Vec3):Float {
		return (a[0] * b[0]) + (a[1] * b[1]) + (a[2] * b[2]);
	}

	/**
	 * Calculates the cross product between two Vec3s
	 * @return   `a ✕ b`
	 */
	public static inline function cross(a:Vec3, b:Vec3):Vec3 {
		return new Vec3(
			a.y * b.z - b.y * a.z,
			a.z * b.x - b.z * a.x,
			a.x * b.y - b.x * a.y
		);
	}

	/**
	 * Converts from Vec2s to Vec3s using standard casting
	 */
	@:from
	public static inline function fromVec2(v:Vec2):Vec3 {
		return new Vec3(v.x, v.y, 0);
	}

	/**
	 * Converts from Vec4s to Vec3s using standard casting
	 */
	@:from
	public static inline function fromVec4(v:Vec4):Vec3 {
		return new Vec3(v.x, v.y, v.z);
	}
}