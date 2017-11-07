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
import kha.math.FastVector4;
#else
@:dox(hide)
@:allow(glm.Vec4)
class Vec4Base {
    function new() {}

    var x:Float;
    var y:Float;
    var z:Float;
    var w:Float;
}
#end

/**
  A four-element vector
 */
#if kha
abstract Vec4(FastVector4) from FastVector4 to FastVector4  {
#else
abstract Vec4(Vec4Base) {
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
      Accessor for the fourth element of the vector
     */
    public var w(get, set):Float;
    private inline function get_w():Float return this.w;
    private inline function set_w(v:Float):Float return this.w = v;
    
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
      Accessor for the fourth element of the vector
     */
    public var a(get, set):Float;
    private inline function get_a():Float return this.w;
    private inline function set_a(v:Float):Float return this.w = v;

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
            case 3: w;
            case _: throw 'Index ${key} out of bounds (0-3)!';
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
            case 3: w = value;
            case _: throw 'Index ${key} out of bounds (0-3)!';
        };
    }

    public inline function new(x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 0) {
        #if kha
        this = new FastVector4();
        #else
        this = new Vec4Base();
        #end
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    /**
      Checks if `this == v` on an element-by-element basis
      @param v - The vector to check against
      @return Bool
     */
    public inline function equals(b:Vec4):Bool {
        return !(
               Math.abs(x - b.x) >= glm.GLM.EPSILON
            || Math.abs(y - b.y) >= glm.GLM.EPSILON
            || Math.abs(z - b.z) >= glm.GLM.EPSILON
            || Math.abs(w - b.w) >= glm.GLM.EPSILON
        );
    }

    /**
      Creates a string reprentation of `this`
      @return String
     */
    public inline function toString():String {
        return
            '<${this.x}, ${this.y}, ${this.z}, ${this.w}>';
    }

    /**
      Calculates the square of the magnitude of the vector, to save calculation time if the actual magnitude isn't needed
      @return Float
     */
    public inline function lengthSquared():Float {
        return x*x + y*y + z*z + w*w;
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
      @return Vec4
     */
    public inline static function copy(src:Vec4, dest:Vec4):Vec4 {
        dest.x = src.x;
        dest.y = src.y;
        dest.z = src.z;
        dest.w = src.w;
        return dest;
    }

    /**
      Utility for setting an entire vector at once
      @param dest The vector to set values into
      @param x 
      @param y 
      @param z 
      @param w 
      @return Vec4
     */
    public inline static function setComponents(dest:Vec4, x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 0):Vec4 {
        dest.x = x;
        dest.y = y;
        dest.z = z;
        dest.w = w;
        return dest;
    }

    /**
      Adds two vectors on an element-by-element basis
      @param a 
      @param b 
      @param dest The vector to store the result in
      @return Vec4
     */
    public inline static function addVec(a:Vec4, b:Vec4, dest:Vec4):Vec4 {
        dest.x = a.x + b.x;
        dest.y = a.y + b.y;
        dest.z = a.z + b.z;
        dest.w = a.w + b.w;
        return dest;
    }

    /**
      Subtracts `b` from `a` on an element-by-element basis
      @param a 
      @param b 
      @param dest The vector to store the result in
      @return Vec4
     */
    public inline static function subtractVec(a:Vec4, b:Vec4, dest:Vec4):Vec4 {
        dest.x = a.x - b.x;
        dest.y = a.y - b.y;
        dest.z = a.z - b.z;
        dest.w = a.w - b.w;
        return dest;
    }

    /**
      Shortcut operator for `addVec(a, b, new Vec4())`
      @param a 
      @param b 
      @return Vec4
     */
    @:op(A + B)
    inline static function addVecOp(a:Vec4, b:Vec4):Vec4 {
        return addVec(a, b, new Vec4());
    }

    /**
      Shortcut operator for `subtractVec(a, b, new Vec4())`
      @param a 
      @param b 
      @return Vec4
     */
    @:op(A - B)
    inline static function subtractVecOp(a:Vec4, b:Vec4):Vec4 {
        return subtractVec(a, b, new Vec4());
    }

    /**
      Adds a scalar to a vector
      @param a The vector to add a scalar to
      @param s A scalar to add
      @param dest The vector to store the result in
      @return Vec4
     */
    public inline static function addScalar(a:Vec4, s:Float, dest:Vec4):Vec4 {
        dest.x = a.x + s;
        dest.y = a.y + s;
        dest.z = a.z + s;
        dest.w = a.w + s;
        return dest;
    }

    /**
      Multiplies the elements of `a` by `s`, storing the result in `dest`
      @param a 
      @param s 
      @param dest 
      @return Vec4
     */
    public inline static function multiplyScalar(a:Vec4, s:Float, dest:Vec4):Vec4 {
        dest.x = a.x * s;
        dest.y = a.y * s;
        dest.z = a.z * s;
        dest.w = a.w * s;
        return dest;
    }

    /**
      Shortcut operator for `addScalar(a, s, new Vec4())`
      @param a 
      @param s 
      @return Vec4
     */
    @:op(A + B)
    inline static function addScalarOp(a:Vec4, s:Float):Vec4 {
        return addScalar(a, s, new Vec4());
    }

    /**
      Shortcut operator for `addScalar(a, -s, new Vec4())`
      @param a 
      @param s 
      @return Vec4
     */
    @:op(A - B)
    inline static function subtractScalarOp(a:Vec4, s:Float):Vec4 {
        return addScalar(a, -s, new Vec4());
    }

    /**
      Shortcut operator for `multiplyScalar(a, s, new Vec4())`
      @param a 
      @param s 
      @return Vec4
     */
    @:op(A * B)
    inline static function multiplyScalarOp(a:Vec4, s:Float):Vec4 {
        return multiplyScalar(a, s, new Vec4());
    }

    /**
      Shortcut operator for `multiplyScalar(a, 1/s, new Vec4())`
      @param a 
      @param s 
      @return Vec4
     */
    @:op(A / B)
    inline static function divideScalarOp(a:Vec4, s:Float):Vec4 {
        return multiplyScalar(a, 1/s, new Vec4());
    }

    /**
      Calculates the square of the distance between two vectors
      @param a 
      @param b 
      @return Float
     */
    public inline static function distanceSquared(a:Vec4, b:Vec4):Float {
        return (a.x - b.x) * (a.x - b.x) +
            (a.y - b.y) * (a.y - b.y) +
            (a.z - b.z) * (a.z - b.z) +
            (a.w - b.w) * (a.w - b.w);
    }

    /**
      Calculates the distance (magnitude) between two vectors
      @param a 
      @param b 
      @return Float
     */
    public inline static function distance(a:Vec4, b:Vec4):Float {
        return Math.sqrt(distanceSquared(a, b));
    }

    /**
      Calculates the dot product of two vectors
      @param a 
      @param b 
      @return Float
     */
    public inline static function dot(a:Vec4, b:Vec4):Float {
        return a.x * b.x +
            a.y * b.y +
            a.z * b.z +
            a.w * b.w;
    }

    /**
      Normalizes `v` such that `v.length() == 1`, and stores the result in `dest`
      @param v 
      @param dest 
      @return Vec4
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
      Linearly interpolates between `a` and `b`.
      @param a The value when `t == 0`
      @param b The value when `t == 1`
      @param t A value between `0` and `1`, not clamped by the function
      @param dest The vector to store the result in
      @return Vec4
     */
    public inline static function lerp(a:Vec4, b:Vec4, t:Float, dest:Vec4):Vec4 {
        dest.x = glm.GLM.lerp(a.x, b.x, t);
        dest.y = glm.GLM.lerp(a.y, b.y, t);
        dest.z = glm.GLM.lerp(a.z, b.z, t);
        dest.w = glm.GLM.lerp(a.w, b.w, t);
        return dest;
    }

    /**
      Construct a Vec4 from an array of floats
      @param arr an array with 4 elements, corresponding to x, y, z, w
      @return Vec4
     */
    @:from
    public inline static function fromFloatArray(arr:Array<Float>):Vec4 {
        return new Vec4(arr[0], arr[1], arr[2], arr[3]);
    }

    /**
      Converts this into a 4-element array of floats
      @return Array<Float>
     */
    @:to
    public inline function toFloatArray():Array<Float> {
        return [x, y, z, w];
    }
}