package glm;

/**
 * Utility class for dealing with quaternions
 */
abstract Quat(Array<Float>) {
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
	 * Utility accessor for the fourth element
	 */
	public var w(get, set):Float;
	function get_w():Float {
		return this[3];
	}
	function set_w(v:Float) {
		return this[3] = v;
	}

	public function new(x:Float=0, y:Float=0, z:Float=0, w:Float=0) {
		var arr:Array<Float> = new Array<Float>();
		arr.push(x);
		arr.push(y);
		arr.push(z);
		arr.push(w);
		this = arr;
	}

	/**
	 * Utility function to set the components
	 */
	public function set(?x:Float, ?y:Float, ?z:Float, ?w:Float):Quat {
		if(x != null) this[0] = x;
		if(y != null) this[1] = y;
		if(z != null) this[2] = z;
		if(w != null) this[3] = w;
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
}