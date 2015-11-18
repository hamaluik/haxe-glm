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
		for(i in 0...3) {
			this[i] = 0;
		}
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
		for(i in 0...3) {
			copy[i] = this[i];
		}
		return copy;
	}


	/**
	 * Element-based addition
	 * @param  b The vector to add to `this`
	 * @return   `this.x + b.x`, etc
	 */
	public function add(b:Vec3):Vec3 {
		this[0] += b[0];
		this[1] += b[1];
		this[2] += b[2];
		return cast this;
	}

	/**
	 * Element-based subtraction
	 * @param  b The vector to subtract from `this`
	 * @return   `this.x - b.x`, etc
	 */
	public function subtract(b:Vec3):Vec3 {
		this[0] -= b[0];
		this[1] -= b[1];
		this[2] -= b[2];
		return cast this;
	}

	/**
	 * Calculates the cross product of `this` and `b`
	 * @param  b the input vector
	 * @return   `this` ✕ `b` <= this
	 */
	public function cross(b:Vec3):Vec3 {
		// cache ourself
		var x:Float = this[0];
		var y:Float = this[1];
		var z:Float = this[2];

		this[0] = (y * b[2]) - (z * b[1]);
		this[1] = (z * b[0]) - (x * b[2]);
		this[2] = (x * b[1]) - (y * b[0]);

		return cast this;
	}

	/**
	 * Calculates the dot product
	 * @param  b the vector to dot with
	 * @return   `this · b`
	 */
	public function dot(b:Vec3):Float {
		return (this[0] * b[0]) + (this[1] * b[1]) + (this[2] * b[2]);
	}

	/**
	 * Provides array access in the form of `vector[i]` where `i ∈ [0, 1, 2]`
	 */
	@:arrayAccess public inline function arrayGet(i:Int):Float {
		return this[i];
	}

	/**
	 * Provides array access in the form of `vector[i] = x` where `i ∈ [0, 1, 2]`
	 */
	@:arrayAccess public inline function arraySet(i:Int, x:Float):Float {
		return this[i] = x;
	}

	#if snow
	public inline function toFloat32Array():snow.api.buffers.Float32Array {
		return new snow.api.buffers.Float32Array(this);
	}
	#end
}