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
import kha.math.FastMatrix2;
#else
@:dox(hide)
@:allow(glm.Mat2)
class Mat2Base {
    function new() {}

    var _00: Float; var _10: Float;
    var _01: Float; var _11: Float;
}
#end

/**
  A 4x4 matrix
 */
#if kha
abstract Mat2(FastMatrix2) from FastMatrix2 to FastMatrix2  {
#else
abstract Mat2(Mat2Base) {
#end
    public inline function new(
            _r0c0:Float = 0, _r0c1:Float = 0,
            _r1c0:Float = 0, _r1c1:Float = 0
        ) {
        #if kha
        this = new FastMatrix2(
            _r0c0, _r0c1,
            _r1c0, _r1c1
        );
        #else
        this = new Mat2Base();
        r0c0 = _r0c0;
        r1c0 = _r1c0;

        r0c1 = _r0c1;
        r1c1 = _r1c1;
        #end
    }

    /**
      Accessor for the element in row 0 and column 0
     */
    public var r0c0(get, set):Float;
    private inline function get_r0c0():Float return this._00;
    private inline function set_r0c0(v:Float):Float return this._00 = v;

    /**
      Accessor for the element in row 1 and column 0
     */
    public var r1c0(get, set):Float;
    private inline function get_r1c0():Float return this._01;
    private inline function set_r1c0(v:Float):Float return this._01 = v;

    /**
      Accessor for the element in row 0 and column 1
     */
    public var r0c1(get, set):Float;
    private inline function get_r0c1():Float return this._10;
    private inline function set_r0c1(v:Float):Float return this._10 = v;

    /**
      Accessor for the element in row 1 and column 1
     */
    public var r1c1(get, set):Float;
    private inline function get_r1c1():Float return this._11;
    private inline function set_r1c1(v:Float):Float return this._11 = v;

    /**
      Read an element using a column-major index
      @param key the index to use
      @return Float
     */
    @:arrayAccess
    public inline function get(key:Int):Float {
        return switch(key) {
            case  0: r0c0;
            case  1: r1c0;
            case  2: r0c1;
            case  3: r1c1;
            case _: throw 'Index ${key} out of bounds (0-3)!';
        };
    }

    /**
      Write to an element using a column-major index
      @param key the index to use
      @param value the value to set
      @return Float
     */
    @:arrayAccess
    public inline function set(key:Int, value:Float):Float {
        return switch(key) {
            case  0: r0c0 = value;
            case  1: r1c0 = value;
            case  2: r0c1 = value;
            case  3: r1c1 = value;
            case _: throw 'Index ${key} out of bounds (0-3)!';
        };
    }

    /**
      Tests if two matrices are equal on an element-by-element basis
      @param m the other matrix to check
      @return Bool
     */
    public inline function equals(b:Mat2):Bool {
        return !(
               Math.abs(r0c0 - b.r0c0) >= glm.GLM.EPSILON
            || Math.abs(r0c1 - b.r0c1) >= glm.GLM.EPSILON
            || Math.abs(r1c0 - b.r1c0) >= glm.GLM.EPSILON
            || Math.abs(r1c1 - b.r1c1) >= glm.GLM.EPSILON
        );
    }

    /**
      Gets a string representation of the matrix
      @return String
     */
    public inline function toString():String {
        return
            '[${r0c0}, ${r0c1}]\n' +
            '[${r1c0}, ${r1c1}]\n';
    }

    /**
      Fill `dest` with an identity matrix
      @param dest the matrix to fill out
      @return Mat2
     */
    public inline static function identity(dest:Mat2):Mat2 {
        dest.r0c0 = 1;
        dest.r0c1 = 0;

        dest.r1c0 = 0;
        dest.r1c1 = 1;

        return dest;
    }

    /**
      Copies one matrix into another
      @param src The matrix to copy from
      @param dest The matrix to copy into
      @return Mat2
     */
    public inline static function copy(src:Mat2, dest:Mat2):Mat2 {
        dest.r0c0 = src.r0c0;
        dest.r0c1 = src.r0c1;
        
        dest.r1c0 = src.r1c0;
        dest.r1c1 = src.r1c1;

        return dest;
    }

    /**
      Transposes a matrix
      @param src The matrix to transpose
      @param dest The destination matrix. Call with `src == dest` to modify `src` in place
      @return Mat2
     */
    public inline static function transpose(src:Mat2, dest:Mat2):Mat2 {
        var src_r1c0 = src.r1c0;

        dest.r0c0 = src.r0c0;
        dest.r1c0 = src.r0c1;

        dest.r0c1 = src_r1c0;
        dest.r1c1 = src.r1c1;

        return dest;
    }

    /**
      Calculates the determinant of the matrix
      @param src The matrix to calculate the determinant of
      @return Float
     */
    public inline static function determinant(src:Mat2):Float {
        return src.r0c0 * src.r1c1 - src.r0c1 * src.r1c0;
    }

    /**
      Inverts the `src` matrix, storing the result in `dest`. If `src == dest`, modifies `src` in place.
      @param src The source matrix
      @param dest The matrix to store the result in
      @return Mat2
     */
    public inline static function invert(src:Mat2, dest:Mat2):Mat2 {
        var det:Float = Mat2.determinant(src);
        if (Math.abs(det) < glm.GLM.EPSILON) {
            throw "determinant is too small";
        }

        var invdet:Float = 1.0 / det;

        var _s:Mat2 = src;
        if(src == dest) _s = Mat2.copy(src, new Mat2());

        dest.r0c0 =  _s.r1c1 * invdet;
        dest.r0c1 = -_s.r0c1 * invdet;
        dest.r1c0 = -_s.r1c0 * invdet;
        dest.r1c1 =  _s.r0c0 * invdet;
        return dest;
    }

    /**
      Multiplies two matrices together, storing the result in `dest`. Caches `a` and `b` so `a == dest` and `b == dest` are valid.
      @param a The left-hand matrix
      @param b The right-hand matrix
      @param dest The matrix to store the result in
      @return Mat2
     */
    public inline static function multMat(a:Mat2, b:Mat2, dest:Mat2):Mat2 {
        // cache what we need to do the calculations
        var _a:Mat2;
        var _b:Mat2;
        if(dest == a) {
            _a = Mat2.copy(a, new Mat2());
            _b = b;
        }
        else if(dest == b) {
            _a = a;
            _b = Mat2.copy(b, new Mat2());
        }
        else {
            _a = a;
            _b = b;
        }

        dest.r0c0 = _a.r0c0*_b.r0c0 + _a.r0c1*_b.r1c0;
        dest.r0c1 = _a.r0c0*_b.r0c1 + _a.r0c1*_b.r1c1;

        dest.r1c0 = _a.r1c0*_b.r0c0 + _a.r1c1*_b.r1c0;
        dest.r1c1 = _a.r1c0*_b.r0c1 + _a.r1c1*_b.r1c1;
        
        return dest;
    }

    /**
      Shortcut operator for `multMat(a, b, new Mat2())`
      @param a 
      @param b 
      @return Mat2
     */
    @:op(A * B)
    inline static function multMatOp(a:Mat2, b:Mat2):Mat2 {
        return multMat(a, b, new Mat2());
    }

    /**
      Multiplies a vector `v` by a matrix `m`, storing the result in `dest`. Caches so `v == dest` is valid.
      @param m The transforming matrix
      @param v The vector to multiply with
      @param dest The resulting vector
      @return Vec4
     */
    public inline static function multVec(m:Mat2, v:Vec2, dest:Vec2):Vec2 {
        var x:Float = v.x, y:Float = v.y;
        dest.x = m.r0c0*x + m.r0c1*y;
        dest.y = m.r1c0*x + m.r1c1*y;
        return dest;
    }

    /**
      Shortcut for `multVec(m, v, new Vec4())`
      @param m 
      @param v 
      @return Vec4
     */
    @:op(A * B)
    inline static function multVecOp(m:Mat2, v:Vec2):Vec2 {
        return multVec(m, v, new Vec2());
    }

    /**
      Construct a Mat2 from an array of floats in column-major order
      @param arr an array with 16 elements
      @return Mat2
     */
    @:from
    public inline static function fromFloatArray(arr:Array<Float>):Mat2 {
        return new Mat2(
            arr[0], arr[2],
            arr[1], arr[3]
        );
    }

    /**
      Cast the matrix in an array of floats, in column-major order
      @return Array<Float>
     */
    @:to
    public inline function toFloatArray():Array<Float> {
        return [
            r0c0, r1c0,
            r0c1, r1c1
        ];
    }
}