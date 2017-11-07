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

#if kha
import kha.math.FastVector3;
#else
@:dox(hide)
@:allow(glm.Vec3)
class Vec3Base {
    function new() {}

    var x:Float;
    var y:Float;
    var z:Float;
}
#end

/**
  A three-element vector
 */
#if kha
abstract Vec3(FastVector3) from FastVector3 to FastVector3  {
#else
abstract Vec3(Vec3Base) {
#end
    /**
      Accessor for the first element of the vector
     */
    public var x(get, set):Float;
    private inline function get_x():Float return this.x;
    private inline function set_x(v:Float):Float return this.x = v;

    /**
      Accessor for the second element of the vector
     */
    public var y(get, set):Float;
    private inline function get_y():Float return this.y;
    private inline function set_y(v:Float):Float return this.y = v;

    /**
      Accessor for the third element of the vector
     */
    public var z(get, set):Float;
    private inline function get_z():Float return this.z;
    private inline function set_z(v:Float):Float return this.z = v;
    
    /**
      Accessor for the first element of the vector
     */
    public var r(get, set):Float;
    private inline function get_r():Float return this.x;
    private inline function set_r(v:Float):Float return this.x = v;

    /**
      Accessor for the second element of the vector
     */
    public var g(get, set):Float;
    private inline function get_g():Float return this.y;
    private inline function set_g(v:Float):Float return this.y = v;

    /**
      Accessor for the third element of the vector
     */
    public var b(get, set):Float;
    private inline function get_b():Float return this.z;
    private inline function set_b(v:Float):Float return this.z = v;

    /**
      Read an element using an index
      @param key the index to use
      @return Float
     */
    @:arrayAccess
    public inline function get(key:Int):Float {
        return switch(key) {
            case 0: x;
            case 1: y;
            case 2: z;
            case _: throw 'Index ${key} out of bounds (0-2)!';
        };
    }

    /**
      Write to an element using an index
      @param key the index to use
      @param value the value to set
      @return Float
     */
    @:arrayAccess
    public inline function set(key:Int, value:Float):Float {
        return switch(key) {
            case 0: x = value;
            case 1: y = value;
            case 2: z = value;
            case _: throw 'Index ${key} out of bounds (0-2)!';
        };
    }

    public inline function new(x:Float = 0, y:Float = 0, z:Float = 0) {
        #if kha
        this = new FastVector3();
        #else
        this = new Vec3Base();
        #end
        this.x = x;
        this.y = y;
        this.z = z;
    }

    /**
      Checks if `this == v` on an element-by-element basis
      @param v - The vector to check against
      @return Bool
     */
    public inline function equals(b:Vec3):Bool {
        return !(
               Math.abs(x - b.x) >= glm.GLM.EPSILON
            || Math.abs(y - b.y) >= glm.GLM.EPSILON
            || Math.abs(z - b.z) >= glm.GLM.EPSILON
        );
    }

    /**
      Creates a string reprentation of `this`
      @return String
     */
    public inline function toString():String {
        return
            '<${this.x}, ${this.y}, ${this.z}>';
    }

    /**
      Calculates the square of the magnitude of the vector, to save calculation time if the actual magnitude isn't needed
      @return Float
     */
    public inline function lengthSquared():Float {
        return x*x + y*y + z*z;
    }

    /**
      Calculates the magnitude of the vector
      @return Float
     */
    public inline function length():Float {
        return Math.sqrt(lengthSquared());
    }

    /**
      Copies one vector into another
      @param src The vector to copy from
      @param dest The vector to copy into
      @return Vec3
     */
    public inline static function copy(src:Vec3, dest:Vec3):Vec3 {
        dest.x = src.x;
        dest.y = src.y;
        dest.z = src.z;
        return dest;
    }

    /**
      Utility for setting an entire vector at once
      @param dest The vector to set values into
      @param x 
      @param y 
      @param z 
      @return Vec3
     */
    public inline static function setComponents(dest:Vec3, x:Float = 0, y:Float = 0, z:Float = 0):Vec3 {
        dest.x = x;
        dest.y = y;
        dest.z = z;
        return dest;
    }

    /**
      Adds two vectors on an element-by-element basis
      @param a 
      @param b 
      @param dest The vector to store the result in
      @return Vec3
     */
    public inline static function addVec(a:Vec3, b:Vec3, dest:Vec3):Vec3 {
        dest.x = a.x + b.x;
        dest.y = a.y + b.y;
        dest.z = a.z + b.z;
        return dest;
    }

    /**
      Subtracts `b` from `a` on an element-by-element basis
      @param a 
      @param b 
      @param dest The vector to store the result in
      @return Vec3
     */
    public inline static function subtractVec(a:Vec3, b:Vec3, dest:Vec3):Vec3 {
        dest.x = a.x - b.x;
        dest.y = a.y - b.y;
        dest.z = a.z - b.z;
        return dest;
    }

    /**
      Shortcut operator for `addVec(a, b, new Vec3())`
      @param a 
      @param b 
      @return Vec3
     */
    @:op(A + B)
    inline static function addVecOp(a:Vec3, b:Vec3):Vec3 {
        return addVec(a, b, new Vec3());
    }

    /**
      Shortcut operator for `subtractVec(a, b, new Vec3())`
      @param a 
      @param b 
      @return Vec3
     */
    @:op(A - B)
    inline static function subtractVecOp(a:Vec3, b:Vec3):Vec3 {
        return subtractVec(a, b, new Vec3());
    }

    /**
      Adds a scalar to a vector
      @param a The vector to add a scalar to
      @param s A scalar to add
      @param dest The vector to store the result in
      @return Vec3
     */
    public inline static function addScalar(a:Vec3, s:Float, dest:Vec3):Vec3 {
        dest.x = a.x + s;
        dest.y = a.y + s;
        dest.z = a.z + s;
        return dest;
    }

    /**
      Multiplies the elements of `a` by `s`, storing the result in `dest`
      @param a 
      @param s 
      @param dest 
      @return Vec3
     */
    public inline static function multiplyScalar(a:Vec3, s:Float, dest:Vec3):Vec3 {
        dest.x = a.x * s;
        dest.y = a.y * s;
        dest.z = a.z * s;
        return dest;
    }

    /**
      Shortcut operator for `addScalar(a, s, new Vec3())`
      @param a 
      @param s 
      @return Vec3
     */
    @:op(A + B)
    inline static function addScalarOp(a:Vec3, s:Float):Vec3 {
        return addScalar(a, s, new Vec3());
    }

    /**
      Shortcut operator for `addScalar(a, -s, new Vec3())`
      @param a 
      @param s 
      @return Vec3
     */
    @:op(A - B)
    inline static function subtractScalarOp(a:Vec3, s:Float):Vec3 {
        return addScalar(a, -s, new Vec3());
    }

    /**
      Shortcut operator for `multiplyScalar(a, s, new Vec3())`
      @param a 
      @param s 
      @return Vec3
     */
    @:op(A * B)
    inline static function multiplyScalarOp(a:Vec3, s:Float):Vec3 {
        return multiplyScalar(a, s, new Vec3());
    }

    /**
      Shortcut operator for `multiplyScalar(a, 1/s, new Vec3())`
      @param a 
      @param s 
      @return Vec3
     */
    @:op(A / B)
    inline static function divideScalarOp(a:Vec3, s:Float):Vec3 {
        return multiplyScalar(a, 1/s, new Vec3());
    }

    /**
      Calculates the square of the distance between two vectors
      @param a 
      @param b 
      @return Float
     */
    public inline static function distanceSquared(a:Vec3, b:Vec3):Float {
        return (a.x - b.x) * (a.x - b.x) +
            (a.y - b.y) * (a.y - b.y) +
            (a.z - b.z) * (a.z - b.z);
    }

    /**
      Calculates the distance (magnitude) between two vectors
      @param a 
      @param b 
      @return Float
     */
    public inline static function distance(a:Vec3, b:Vec3):Float {
        return Math.sqrt(distanceSquared(a, b));
    }

    /**
      Calculates the dot product of two vectors
      @param a 
      @param b 
      @return Float
     */
    public inline static function dot(a:Vec3, b:Vec3):Float {
        return a.x * b.x +
            a.y * b.y +
            a.z * b.z;
    }

    /**
      Calculates the cross product of `a` and `b`
      @param a The left-hand side vector to cross
      @param b The right-hand side vector to cross
      @param dest Where to store the result
      @return Vec3 `dest`
     */
    public inline static function cross(a:Vec3, b:Vec3, dest:Vec3):Vec3 {
        // TODO: better caching?
        dest = new Vec3(
            a.y * b.z - a.z * b.y,
            a.z * b.x - a.x * b.z,
            a.x * b.y - a.y * b.x);
        return dest;
    }

    /**
      Normalizes `v` such that `v.length() == 1`, and stores the result in `dest`
      @param v 
      @param dest 
      @return Vec3
     */
    public inline static function normalize(v:Vec3, dest:Vec3):Vec3 {
        var length:Float = v.length();
        var mult:Float = 0;
        if(length >= glm.GLM.EPSILON) {
            mult = 1 / length;
        }
        return Vec3.multiplyScalar(v, mult, dest);
    }

    /**
      Linearly interpolates between `a` and `b`.
      @param a The value when `t == 0`
      @param b The value when `t == 1`
      @param t A value between `0` and `1`, not clamped by the function
      @param dest The vector to store the result in
      @return Vec3
     */
    public inline static function lerp(a:Vec3, b:Vec3, t:Float, dest:Vec3):Vec3 {
        dest.x = glm.GLM.lerp(a.x, b.x, t);
        dest.y = glm.GLM.lerp(a.y, b.y, t);
        dest.z = glm.GLM.lerp(a.z, b.z, t);
        return dest;
    }

    /**
      Construct a Vec3 from an array of floats
      @param arr an array with 3 elements, corresponding to x, y, z
      @return Vec3
     */
    @:from
    public inline static function fromFloatArray(arr:Array<Float>):Vec3 {
        return new Vec3(arr[0], arr[1], arr[2]);
    }

    /**
      Converts this into a 3-element array of floats
      @return Array<Float>
     */
    @:to
    public inline function toFloatArray():Array<Float> {
        return [x, y, z];
    }
}