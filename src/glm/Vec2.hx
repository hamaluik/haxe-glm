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

import glm.GLM.FloatArray;

/**
 *  A two-element vector
 */
abstract Vec2(FloatArray) {
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
     *  Accessor utility for the first element of the vector
     */
    public var i(get, set):Float;
    private inline function get_i():Float return this[0];
    private inline function set_i(v:Float):Float return this[0] = v;

    /**
     *  Accessor utility for the second element of the vector
     */
    public var j(get, set):Float;
    private inline function get_j():Float return this[1];
    private inline function set_j(v:Float):Float return this[1] = v;

	@:arrayAccess
	public inline function get(key:Int) {
		return this[key];
	}

	@:arrayAccess
	public inline function arrayWrite(key:Int, value:Float):Float {
		return this[key] = value;
	}

    public inline function new(x:Float = 0, y:Float = 0) {
        this = new FloatArray(4);
        this[0] = x;
        this[1] = y;
    }

	/**
	 *  Checks if `this == v` on an element-by-element basis
	 *  @param v - The vector to check against
	 *  @return Bool
	 */
	public inline function equals(b:Vec2):Bool {
		var equal:Bool = true;
		for(i in 0...2) {
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
			'<${this[0]}, ${this[1]}>';
	}

    /**
     *  Calculates the square of the magnitude of the vector, to save calculation time if the actual magnitude isn't needed
     *  @return Float
     */
    public inline function lengthSquared():Float {
        return x*x + y*y;
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
	 *  @return Vec2
	 */
	public inline static function copy(src:Vec2, dest:Vec2):Vec2 {
        dest.x = src.x;
        dest.y = src.y;
        return dest;
    }

    /**
     *  Utility for setting an entire vector at once
     *  @param dest - The vector to set values into
     *  @param x - 
     *  @param y - 
     *  @return Vec2
     */
    public inline static function set(dest:Vec2, x:Float = 0, y:Float = 0):Vec2 {
        dest.x = x;
        dest.y = y;
        return dest;
    }

    /**
     *  Adds two vectors on an element-by-element basis
     *  @param a - 
     *  @param b - 
     *  @param dest - The vector to store the result in
     *  @return Vec2
     */
    public inline static function addVec(a:Vec2, b:Vec2, dest:Vec2):Vec2 {
        dest.x = a.x + b.x;
        dest.y = a.y + b.y;
        return dest;
    }

    /**
     *  Subtracts `b` from `a` on an element-by-element basis
     *  @param a - 
     *  @param b - 
     *  @param dest - The vector to store the result in
     *  @return Vec2
     */
    public inline static function subtractVec(a:Vec2, b:Vec2, dest:Vec2):Vec2 {
        dest.x = a.x - b.x;
        dest.y = a.y - b.y;
        return dest;
    }

    /**
     *  Shortcut operator for `addVec(a, b, new Vec2())`
     *  @param a - 
     *  @param b - 
     *  @return Vec2
     */
    @:op(A + B)
    public inline static function addVecOp(a:Vec2, b:Vec2):Vec2 {
        return addVec(a, b, new Vec2());
    }

    /**
     *  Shortcut operator for `subtractVec(a, b, new Vec2())`
     *  @param a - 
     *  @param b - 
     *  @return Vec2
     */
    @:op(A - B)
    public inline static function subtractVecOp(a:Vec2, b:Vec2):Vec2 {
        return subtractVec(a, b, new Vec2());
    }

    /**
     *  Adds a scalar to a vector
     *  @param a - The vector to add a scalar to
     *  @param s - A scalar to add
     *  @param dest - The vector to store the result in
     *  @return Vec2
     */
    public inline static function addScalar(a:Vec2, s:Float, dest:Vec2):Vec2 {
        dest.x = a.x + s;
        dest.y = a.y + s;
        return dest;
    }

    /**
     *  Multiplies the elements of `a` by `s`, storing the result in `dest`
     *  @param a - 
     *  @param s - 
     *  @param dest - 
     *  @return Vec2
     */
    public inline static function multiplyScalar(a:Vec2, s:Float, dest:Vec2):Vec2 {
        dest.x = a.x * s;
        dest.y = a.y * s;
        return dest;
    }

    /**
     *  Shortcut operator for `addScalar(a, s, new Vec2())`
     *  @param a - 
     *  @param s - 
     *  @return Vec2
     */
    @:op(A + B)
    public inline static function addScalarOp(a:Vec2, s:Float):Vec2 {
        return addScalar(a, s, new Vec2());
    }

    /**
     *  Shortcut operator for `addScalar(a, -s, new Vec2())`
     *  @param a - 
     *  @param s - 
     *  @return Vec2
     */
    @:op(A - B)
    public inline static function subtractScalarOp(a:Vec2, s:Float):Vec2 {
        return addScalar(a, -s, new Vec2());
    }

    /**
     *  Shortcut operator for `multiplyScalar(a, s, new Vec2())`
     *  @param a - 
     *  @param s - 
     *  @return Vec2
     */
    @:op(A * B)
    public inline static function multiplyScalarOp(a:Vec2, s:Float):Vec2 {
        return multiplyScalar(a, s, new Vec2());
    }

    /**
     *  Shortcut operator for `multiplyScalar(a, 1/s, new Vec2())`
     *  @param a - 
     *  @param s - 
     *  @return Vec2
     */
    @:op(A / B)
    public inline static function divideScalarOp(a:Vec2, s:Float):Vec2 {
        return multiplyScalar(a, 1/s, new Vec2());
    }

    /**
     *  Calculates the square of the distance between two vectors
     *  @param a - 
     *  @param b - 
     *  @return Float
     */
    public inline static function distanceSquared(a:Vec2, b:Vec2):Float {
        return (a.x - b.x) * (a.x - b.x) +
            (a.y - b.y) * (a.y - b.y);
    }

    /**
     *  Calculates the distance (magnitude) between two vectors
     *  @param a - 
     *  @param b - 
     *  @return Float
     */
    public inline static function distance(a:Vec2, b:Vec2):Float {
        return Math.sqrt(distanceSquared(a, b));
    }

    /**
     *  Calculates the dot product of two vectors
     *  @param a - 
     *  @param b - 
     *  @return Float
     */
    public inline static function dot(a:Vec2, b:Vec2):Float {
        return a.x * b.x +
            a.y * b.y;
    }

    /**
     *  Calculates the cross product of `a` and `b`
     *  @param a - The left-hand side vector to cross
     *  @param b - The right-hand side vector to cross
     *  @param dest - Where to store the result
     *  @return Vec3 `dest`
     */
    public inline static function cross(a:Vec2, b:Vec2, dest:Vec3):Vec3 {
        dest = new Vec3(
            0,
            0,
            a.x * b.y - a.y * b.x);
        return dest;
    }

    /**
     *  Normalizes `v` such that `v.length() == 1`, and stores the result in `dest`
     *  @param v - 
     *  @param dest - 
     *  @return Vec2
     */
    public inline static function normalize(v:Vec2, dest:Vec2):Vec2 {
        var length:Float = v.length();
        var mult:Float = 0;
        if(length >= glm.GLM.EPSILON) {
            mult = 1 / length;
        }
        return Vec2.multiplyScalar(v, mult, dest);
    }

    /**
     *  Linearly interpolates between `a` and `b`.
     *  @param a - The value when `t == 0`
     *  @param b - The value when `t == 1`
     *  @param t - A value between `0` and `1`, not clamped by the function
     *  @param dest - The vector to store the result in
     *  @return Vec2
     */
    public inline static function lerp(a:Vec2, b:Vec2, t:Float, dest:Vec2):Vec2 {
        dest.x = glm.GLM.lerp(a.x, b.x, t);
        dest.y = glm.GLM.lerp(a.y, b.y, t);
        return dest;
    }

    /**
     *  Construct a Vec2 from an array of floats
     *  @param arr an array with 2 elements, corresponding to x, y
     *  @return Vec2
     */
    @:from
    public inline static function fromFloatArray(arr:Array<Float>):Vec2 {
        return new Vec2(arr[0], arr[1]);
    }
}