/*
 * Copyright (c) 2017 Kenton Hamaluik
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
package glm;

import haxe.ds.Vector;

/**
 *  A four-element vector
 */
abstract Vec4(Vector<Float>) to Vector<Float> {
    /**
     *  Accessor utility for the first element of the vector
     */
    public var x(get, set):Float;
    private inline function get_x():Float return this[0];
    private inline function set_x(v:Float):Float return this[0] = v;

    /**
     *  Accessor utility for the second element of the vector
     */
    public var y(get, set):Float;
    private inline function get_y():Float return this[1];
    private inline function set_y(v:Float):Float return this[1] = v;

    /**
     *  Accessor utility for the third element of the vector
     */
    public var z(get, set):Float;
    private inline function get_z():Float return this[2];
    private inline function set_z(v:Float):Float return this[2] = v;

    /**
     *  Accessor utility for the fourth element of the vector
     */
    public var w(get, set):Float;
    private inline function get_w():Float return this[3];
    private inline function set_w(v:Float):Float return this[3] = v;
    
    /**
     *  Accessor utility for the first element of the vector
     */
    public var r(get, set):Float;
    private inline function get_r():Float return this[0];
    private inline function set_r(v:Float):Float return this[0] = v;

    /**
     *  Accessor utility for the second element of the vector
     */
    public var g(get, set):Float;
    private inline function get_g():Float return this[1];
    private inline function set_g(v:Float):Float return this[1] = v;

    /**
     *  Accessor utility for the third element of the vector
     */
    public var b(get, set):Float;
    private inline function get_b():Float return this[2];
    private inline function set_b(v:Float):Float return this[2] = v;

    /**
     *  Accessor utility for the fourth element of the vector
     */
    public var a(get, set):Float;
    private inline function get_a():Float return this[3];
    private inline function set_a(v:Float):Float return this[3] = v;

	@:arrayAccess
	public inline function get(key:Int) {
		return this[key];
	}

	@:arrayAccess
	public inline function arrayWrite(key:Int, value:Float):Float {
		return this[key] = value;
	}

    public inline function new(x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 0) {
        this = new Vector<Float>(4);
        this[0] = x;
        this[1] = y;
        this[2] = z;
        this[3] = w;
    }

	/**
	 *  Checks if `this == v` on an element-by-element basis
	 *  @param v - The vector to check against
	 *  @return Bool
	 */
	public inline function equals(b:Vec4):Bool {
		var equal:Bool = true;
		for(i in 0...4) {
			if(Math.abs(this[i] - b[i]) >= glm.GLM.EPSILON) {
				equal = false;
				break;
			}
		}
		return equal;
	}

	/**
	 *  Creates a string reprentation of `this`
	 *  @return String
	 */
	public inline function toString():String {
		return
			'<${this[0]}, ${this[1]}, ${this[2]}, ${this[3]}>';
	}

    /**
     *  Calculates the square of the magnitude of the vector, to save calculation time if the actual magnitude isn't needed
     *  @return Float
     */
    public inline function lengthSquared():Float {
        return x*x + y*y + z*z + w*w;
    }

    /**
     *  Calculates the magnitude of the vector
     *  @return Float
     */
    public inline function length():Float {
        return Math.sqrt(lengthSquared());
    }

	/**
	 *  Copies one vector into another
	 *  @param src - The vector to copy from
	 *  @param dest - The vector to copy into
	 *  @return Vec4
	 */
	public inline static function copy(src:Vec4, dest:Vec4):Vec4 {
        dest[0] = src[0];
        dest[1] = src[1];
        dest[2] = src[2];
        dest[3] = src[3];
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
    public inline static function set(dest:Vec4, x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 0):Vec4 {
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
    public inline static function addVec(a:Vec4, b:Vec4, dest:Vec4):Vec4 {
        dest[0] = a[0] + b[0];
        dest[1] = a[1] + b[1];
        dest[2] = a[2] + b[2];
        dest[3] = a[3] + b[3];
        return dest;
    }

    /**
     *  Subtracts `b` from `a` on an element-by-element basis
     *  @param a - 
     *  @param b - 
     *  @param dest - The vector to store the result in
     *  @return Vec4
     */
    public inline static function subtractVec(a:Vec4, b:Vec4, dest:Vec4):Vec4 {
        dest[0] = a[0] - b[0];
        dest[1] = a[1] - b[1];
        dest[2] = a[2] - b[2];
        dest[3] = a[3] - b[3];
        return dest;
    }

    /**
     *  Shortcut operator for `addVec(a, b, new Vec4())`
     *  @param a - 
     *  @param b - 
     *  @return Vec4
     */
    @:op(A + B)
    public inline static function addVecOp(a:Vec4, b:Vec4):Vec4 {
        return addVec(a, b, new Vec4());
    }

    /**
     *  Shortcut operator for `subtractVec(a, b, new Vec4())`
     *  @param a - 
     *  @param b - 
     *  @return Vec4
     */
    @:op(A - B)
    public inline static function subtractVecOp(a:Vec4, b:Vec4):Vec4 {
        return subtractVec(a, b, new Vec4());
    }

    /**
     *  Adds a scalar to a vector
     *  @param a - The vector to add a scalar to
     *  @param s - A scalar to add
     *  @param dest - The vector to store the result in
     *  @return Vec4
     */
    public inline static function addScalar(a:Vec4, s:Float, dest:Vec4):Vec4 {
        dest[0] = a[0] + s;
        dest[1] = a[1] + s;
        dest[2] = a[2] + s;
        dest[3] = a[3] + s;
        return dest;
    }

    /**
     *  Multiplies the elements of `a` by `s`, storing the result in `dest`
     *  @param a - 
     *  @param s - 
     *  @param dest - 
     *  @return Vec4
     */
    public inline static function multiplyScalar(a:Vec4, s:Float, dest:Vec4):Vec4 {
        dest[0] = a[0] * s;
        dest[1] = a[1] * s;
        dest[2] = a[2] * s;
        dest[3] = a[3] * s;
        return dest;
    }

    /**
     *  Shortcut operator for `addScalar(a, s, new Vec4())`
     *  @param a - 
     *  @param s - 
     *  @return Vec4
     */
    @:op(A + B)
    public inline static function addScalarOp(a:Vec4, s:Float):Vec4 {
        return addScalar(a, s, new Vec4());
    }

    /**
     *  Shortcut operator for `addScalar(a, -s, new Vec4())`
     *  @param a - 
     *  @param s - 
     *  @return Vec4
     */
    @:op(A - B)
    public inline static function subtractScalarOp(a:Vec4, s:Float):Vec4 {
        return addScalar(a, -s, new Vec4());
    }

    /**
     *  Shortcut operator for `multiplyScalar(a, s, new Vec4())`
     *  @param a - 
     *  @param s - 
     *  @return Vec4
     */
    @:op(A * B)
    public inline static function multiplyScalarOp(a:Vec4, s:Float):Vec4 {
        return multiplyScalar(a, s, new Vec4());
    }

    /**
     *  Shortcut operator for `multiplyScalar(a, 1/s, new Vec4())`
     *  @param a - 
     *  @param s - 
     *  @return Vec4
     */
    @:op(A / B)
    public inline static function divideScalarOp(a:Vec4, s:Float):Vec4 {
        return multiplyScalar(a, 1/s, new Vec4());
    }

    /**
     *  Calculates the square of the distance between two vectors
     *  @param a - 
     *  @param b - 
     *  @return Float
     */
    public inline static function distanceSquared(a:Vec4, b:Vec4):Float {
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
    public inline static function distance(a:Vec4, b:Vec4):Float {
        return Math.sqrt(distanceSquared(a, b));
    }

    /**
     *  Calculates the dot product of two vectors
     *  @param a - 
     *  @param b - 
     *  @return Float
     */
    public inline static function dot(a:Vec4, b:Vec4):Float {
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
    public inline static function normalize(v:Vec4, dest:Vec4):Vec4 {
        var length:Float = v.length();
        var mult:Float = 0;
        if(length >= glm.GLM.EPSILON) {
            mult = 1 / length;
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
    public inline static function lerp(a:Vec4, b:Vec4, t:Float, dest:Vec4):Vec4 {
        dest.x = glm.GLM.lerp(a.x, b.x, t);
        dest.y = glm.GLM.lerp(a.y, b.y, t);
        dest.z = glm.GLM.lerp(a.z, b.z, t);
        dest.w = glm.GLM.lerp(a.w, b.w, t);
        return dest;
    }

    /**
     *  Construct a Vec4 from an array of floats
     *  @param arr an array with 4 elements, corresponding to x, y, z, w
     *  @return Vec4
     */
    @:from
    public inline static function fromFloatArray(arr:Array<Float>):Vec4 {
        return new Vec4(arr[0], arr[1], arr[2], arr[3]);
    }

    /**
     *  Converts this into a 4-element array of floats
     *  @return Array<Float>
     */
    @:to
    public inline function toFloatArray():Array<Float> {
        return this.toArray();
    }
}