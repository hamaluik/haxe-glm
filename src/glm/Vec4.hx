package glm;

import glm.GLM.FloatArray;

/**
 *  Custom iterator for the elements of a `Vec4`
 */
class Vec4Iterator {
    var i:Int;
    var v:Vec4;

    public function new(v:Vec4) {
        this.v = v;
        this.i = 0;
    }

    public function hasNext():Bool {
        return this.i < 4;
    }

    public function next():Float {
        return v.e[i++];
    }
}

/**
 *  A four-element vector
 */
class Vec4 {
	/**
	 *  The data stored in the vector
	 */
	public var e:FloatArray;

    /**
     *  Accessor utility for the first element of the vector
     */
    public var x(get, set):Float;
    private function get_x():Float {
        return e[0];
    }
    private function set_x(v:Float):Float {
        return e[0] = v;
    }

    /**
     *  Accessor utility for the second element of the vector
     */
    public var y(get, set):Float;
    private function get_y():Float {
        return e[1];
    }
    private function set_y(v:Float):Float {
        return e[1] = v;
    }

    /**
     *  Accessor utility for the third element of the vector
     */
    public var z(get, set):Float;
    private function get_z():Float {
        return e[2];
    }
    private function set_z(v:Float):Float {
        return e[2] = v;
    }

    /**
     *  Accessor utility for the fourth element of the vector
     */
    public var w(get, set):Float;
    private function get_w():Float {
        return e[3];
    }
    private function set_w(v:Float):Float {
        return e[3] = v;
    }

    public function new(x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 0) {
        e = new FloatArray(4);
        e[0] = x;
        e[1] = y;
        e[2] = z;
        e[3] = w;
    }

	/**
	 *  Checks if `this == v` on an element-by-element basis
	 *  @param v - The vector to check against
	 *  @return Bool
	 */
	public function equals(v:Vec4):Bool {
		for(i in 0...4) {
			if(Math.abs(e[i] - v.e[i]) >= 0.000000001) {
				return false;
			}
		}
		return true;
	}

	/**
	 *  Creates a string reprentation of `this`
	 *  @return String
	 */
	public function toString():String {
		return
			'<${e[0]}, ${e[1]}, ${e[2]}, ${e[3]}>';
	}

    /**
     *  Calculates the square of the magnitude of the vector, to save calculation time if the actual magnitude isn't needed
     *  @return Float
     */
    public function lengthSquared():Float {
        return x*x + y*y + z*z + w*w;
    }

    /**
     *  Calculates the magnitude of the vector
     *  @return Float
     */
    public function length():Float {
        return Math.sqrt(lengthSquared());
    }

	/**
	 *  Copies one vector into another
	 *  @param src - The vector to copy from
	 *  @param dest - The vector to copy into
	 *  @return Vec4
	 */
	public static function copy(src:Vec4, dest:Vec4):Vec4 {
        dest.e[0] = src.e[0];
        dest.e[1] = src.e[1];
        dest.e[2] = src.e[2];
        dest.e[3] = src.e[3];
        return dest;
    }

    /**
     *  Utility for setting an entire vector at once
     *  @param dest - The vector to set values into
     *  @param x - 
     *  @param y - 
     *  @param z - 
     *  @param w - 
     *  @return Vec4
     */
    public static function set(dest:Vec4, x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 0):Vec4 {
        dest.x = x;
        dest.y = y;
        dest.z = z;
        dest.w = w;
        return dest;
    }

    /**
     *  Adds two vectors on an element-by-element basis
     *  @param a - 
     *  @param b - 
     *  @param dest - The vector to store the result in
     *  @return Vec4
     */
    public static function addVec(a:Vec4, b:Vec4, dest:Vec4):Vec4 {
        dest.e[0] = a.e[0] + b.e[0];
        dest.e[1] = a.e[1] + b.e[1];
        dest.e[2] = a.e[2] + b.e[2];
        dest.e[3] = a.e[3] + b.e[3];
        return dest;
    }

    /**
     *  Adds a scalar to a vector
     *  @param a - The vector to add a scalar to
     *  @param s - A scalar to add
     *  @param dest - The vector to store the result in
     *  @return Vec4
     */
    public static function addScalar(a:Vec4, s:Float, dest:Vec4):Vec4 {
        dest.e[0] = a.e[0] + s;
        dest.e[1] = a.e[1] + s;
        dest.e[2] = a.e[2] + s;
        dest.e[3] = a.e[3] + s;
        return dest;
    }

    /**
     *  Subtracts `b` from `a` on an element-by-element basis
     *  @param a - 
     *  @param b - 
     *  @param dest - The vector to store the result in
     *  @return Vec4
     */
    public static function subtractVec(a:Vec4, b:Vec4, dest:Vec4):Vec4 {
        dest.e[0] = a.e[0] - b.e[0];
        dest.e[1] = a.e[1] - b.e[1];
        dest.e[2] = a.e[2] - b.e[2];
        dest.e[3] = a.e[3] - b.e[3];
        return dest;
    }

    public static function multiplyScalar(a:Vec4, s:Float, dest:Vec4):Vec4 {
        dest.e[0] = a.e[0] * s;
        dest.e[1] = a.e[1] * s;
        dest.e[2] = a.e[2] * s;
        dest.e[3] = a.e[3] * s;
        return dest;
    }

    /**
     *  Calculates the square of the distance between two vectors
     *  @param a - 
     *  @param b - 
     *  @return Float
     */
    public static function distanceSquared(a:Vec4, b:Vec4):Float {
        return (a.x - b.x) * (a.x - b.x) +
            (a.y - b.y) * (a.y - b.y) +
            (a.z - b.z) * (a.z - b.z) +
            (a.w - b.w) * (a.w - b.w);
    }

    /**
     *  Calculates the distance (magnitude) between two vectors
     *  @param a - 
     *  @param b - 
     *  @return Float
     */
    public static function distance(a:Vec4, b:Vec4):Float {
        return Math.sqrt(distanceSquared(a, b));
    }

    /**
     *  Calculates the dot product of two vectors
     *  @param a - 
     *  @param b - 
     *  @return Float
     */
    public static function dot(a:Vec4, b:Vec4):Float {
        return a.x * b.x +
            a.y * b.y +
            a.z * b.z +
            a.w * b.w;
    }

    /**
     *  Normalizes `v` such that `v.length() == 1`, and stores the result in `dest`
     *  @param v - 
     *  @param dest - 
     *  @return Vec4
     */
    public static function normalize(v:Vec4, dest:Vec4):Vec4 {
        var lengthSquared:Float = v.lengthSquared();
        var mult:Float = 0;
        if(lengthSquared >= glm.GLM.EPSILON) {
            mult = 1 / lengthSquared;
        }
        return Vec4.multiplyScalar(v, mult, dest);
    }

    /**
     *  Linearly interpolates between `a` and `b`.
     *  @param a - The value when `t == 0`
     *  @param b - The value when `t == 1`
     *  @param t - A value between `0` and `1`, not clamped by the function
     *  @param dest - The vector to store the result in
     *  @return Vec4
     */
    public static function lerp(a:Vec4, b:Vec4, t:Float, dest:Vec4):Vec4 {
        dest.x = glm.GLM.lerp(a.x, b.x, t);
        dest.y = glm.GLM.lerp(a.y, b.y, t);
        dest.z = glm.GLM.lerp(a.z, b.z, t);
        dest.w = glm.GLM.lerp(a.w, b.w, t);
        return dest;
    }

    /**
     *  Iterator for read-only access of the elements of `this`
     *  @return Vec4Iterator
     */
    public function iterator():Vec4Iterator {
        return new Vec4Iterator(this);
    }
}