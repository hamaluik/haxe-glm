package glm;

/**
 * Utility class for dealing with quaternions
 */
abstract Quat(Array<Float>) {
	/**
	 * Utility accessor for the real element
	 */
	public var w(get, set):Float;
	function get_w():Float {
		return this[0];
	}
	function set_w(v:Float) {
		return this[0] = v;
	}

	/**
	 * Utility accessor for the first imaginary element
	 */
	public var x(get, set):Float;
	function get_x():Float {
		return this[1];
	}
	function set_x(v:Float) {
		return this[1] = v;
	}

	/**
	 * Utility accessor for the second imaginary element
	 */
	public var y(get, set):Float;
	function get_y():Float {
		return this[2];
	}
	function set_y(v:Float) {
		return this[2] = v;
	}

	/**
	 * Utility accessor for the third imaginary element
	 */
	public var z(get, set):Float;
	function get_z():Float {
		return this[3];
	}
	function set_z(v:Float) {
		return this[3] = v;
	}

	public function new(w:Float=0, x:Float=0, y:Float=0, z:Float=0) {
		var arr:Array<Float> = new Array<Float>();
		arr.push(w);
		arr.push(x);
		arr.push(y);
		arr.push(z);
		this = arr;
	}

	/**
	 * Utility function to set the components
	 */
	public function set(?w:Float, ?x:Float, ?y:Float, ?z:Float):Quat {
		if(w != null) this[0] = w;
		if(x != null) this[1] = x;
		if(y != null) this[2] = y;
		if(z != null) this[3] = z;
		return cast this;
	}

	/**
	 * Photocopies `this`
	 * @return A new `Quat` who's elements are the same as `this`
	 */
	public function clone():Quat {
		var copy:Quat = new Quat();
		copy[0] = this[0];
		copy[1] = this[1];
		copy[2] = this[2];
		copy[3] = this[3];
		return copy;
	}

	/**
	 * Provides array access in the form of `vec[i]` where `i ∈ [0, 1, 2, 3]`
	 */
	@:arrayAccess public inline function arrayGet(i:Int):Float {
		return this[i];
	}

	/**
	 * Provides array access in the form of `vec[i] = x` where `i ∈ [0, 1, 2, 3]`
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
	 * Makes `this` an identity quaternion, representing no rotation
	 * @return `this`
	 */
	public inline function setIdentity():Quat {
		this[0] = 1;
		this[1] = 0;
		this[2] = 0;
		this[3] = 0;
		return cast this;
	}

	/**
	 * Spawns a new quat representing an identity quaternion
	 */
	public static inline function identity():Quat {
		var q:Quat = new Quat();
		q.setIdentity();
		return q;
	}

	/**
	 * Sets a values of `this` to 0
	 * @return `this`
	 */
	public inline function setZero():Quat {
		this[0] = 0;
		this[1] = 0;
		this[2] = 0;
		this[3] = 0;
		return cast this;
	}

	/**
	 * Spawns a new quat where all elements are 0
	 */
	public static inline function zero():Quat {
		var q:Quat = new Quat();
		q.setZero();
		return q;
	}

	/**
	 * Calculates the square of the L2-norm of the quaternion, `sqrt` it to get the length.
	 * @return `x^2 + y^2 + z^2 + w^2`
	 */
	public inline function sqrLength():Float {
		return (this[0] * this[0]) + (this[1] * this[1]) + (this[2] * this[2]) + (this[3] * this[3]);
	}

	/**
	 * Calculates the L2-norm of the vector
	 * @return The length (magnitude) of the vector
	 */
	public inline function length():Float {
		return Math.sqrt(sqrLength());
	}

	/**
	 * Normalizes the vector such that its `length == 1` while maintaining direction
	 * @return `this`, normalized
	 */
	public inline function normalize():Vec4 {
		var l:Float = length();
		if(l != 0) {
			this[0] /= l;
			this[1] /= l;
			this[2] /= l;
			this[3] /= l;
		}
		else {
			setZero();
		}
		return cast this;
	}

	/**
	 * Calculates the conjugate of the quaternion. If the quaternion is normalized,
	 * this function is faster than Quat.invert and produces the same result.
	 */
	public inline function conjugate():Quat {
		this.x *= -1;
		this.y *= -1;
		this.z *= -1;
		return cast this;
	}

	/**
	 * Calculates the inverse of the quaternion
	 * @return [description]
	 */
	public inline function invert():Quat {
		var a:Array<Float> = [this[0], this[1], this[2], this[3]];
		var dot:Float = (this[0] * a[0]) + (this[1] * a[1]) + (this[2] * a[2])
			+ (this[3] * a[3]);

		if(dot == 0) {
			setZero();
			return cast this;
		}
		var invDot:Float = 1.0 / dot;

		this[0] =  a[0] * invDot;
		this[1] = -a[1] * invDot;
		this[2] = -a[2] * invDot;
		this[3] = -a[3] * invDot;
		return cast this;
	}
}