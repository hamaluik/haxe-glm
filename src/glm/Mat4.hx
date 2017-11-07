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
import kha.math.FastMatrix4;
#else
@:allow(glm.Mat4)
class Mat4Base {
    function new() {}

	var _00: Float; var _10: Float; var _20: Float; var _30: Float;
	var _01: Float; var _11: Float; var _21: Float; var _31: Float;
	var _02: Float; var _12: Float; var _22: Float; var _32: Float;
	var _03: Float; var _13: Float; var _23: Float; var _33: Float;
}
#end

/**
 *  A 4x4 matrix
 */
#if kha
abstract Mat4(FastMatrix4) from FastMatrix4 to FastMatrix4  {
#else
abstract Mat4(Mat4Base) {
#end
	public inline function new(
			_r0c0:Float = 0, _r0c1:Float = 0, _r0c2:Float = 0, _r0c3:Float = 0,
			_r1c0:Float = 0, _r1c1:Float = 0, _r1c2:Float = 0, _r1c3:Float = 0,
			_r2c0:Float = 0, _r2c1:Float = 0, _r2c2:Float = 0, _r2c3:Float = 0,
			_r3c0:Float = 0, _r3c1:Float = 0, _r3c2:Float = 0, _r3c3:Float = 0) {
        #if kha
        this = new FastMatrix4(
			_r0c0, _r0c1, _r0c2, _r0c3,
			_r1c0, _r1c1, _r1c2, _r1c3,
			_r2c0, _r2c1, _r2c2, _r2c3,
			_r3c0, _r3c1, _r3c2, _r3c3
		);
        #else
        this = new Mat4Base();
		r0c0 = _r0c0;
		r1c0 = _r1c0;
		r2c0 = _r2c0;
		r3c0 = _r3c0;

		r0c1 = _r0c1;
		r1c1 = _r1c1;
		r2c1 = _r2c1;
		r3c1 = _r3c1;

		r0c2 = _r0c2;
		r1c2 = _r1c2;
		r2c2 = _r2c2;
		r3c2 = _r3c2;

		r0c3 = _r0c3;
		r1c3 = _r1c3;
		r2c3 = _r2c3;
		r3c3 = _r3c3;
        #end
	}

	/**
	 *  Accessor for the element in row 0 and column 0
	 */
	public var r0c0(get, set):Float;
	private inline function get_r0c0():Float return this._00;
	private inline function set_r0c0(v:Float):Float return this._00 = v;

	/**
	 *  Accessor for the element in row 1 and column 0
	 */
	public var r1c0(get, set):Float;
	private inline function get_r1c0():Float return this._01;
	private inline function set_r1c0(v:Float):Float return this._01 = v;

	/**
	 *  Accessor for the element in row 2 and column 0
	 */
	public var r2c0(get, set):Float;
	private inline function get_r2c0():Float return this._02;
	private inline function set_r2c0(v:Float):Float return this._02 = v;

	/**
	 *  Accessor for the element in row 3 and column 0
	 */
	public var r3c0(get, set):Float;
	private inline function get_r3c0():Float return this._03;
	private inline function set_r3c0(v:Float):Float return this._03 = v;

	/**
	 *  Accessor for the element in row 0 and column 1
	 */
	public var r0c1(get, set):Float;
	private inline function get_r0c1():Float return this._10;
	private inline function set_r0c1(v:Float):Float return this._10 = v;

	/**
	 *  Accessor for the element in row 1 and column 1
	 */
	public var r1c1(get, set):Float;
	private inline function get_r1c1():Float return this._11;
	private inline function set_r1c1(v:Float):Float return this._11 = v;

	/**
	 *  Accessor for the element in row 2 and column 1
	 */
	public var r2c1(get, set):Float;
	private inline function get_r2c1():Float return this._12;
	private inline function set_r2c1(v:Float):Float return this._12 = v;

	/**
	 *  Accessor for the element in row 3 and column 1
	 */
	public var r3c1(get, set):Float;
	private inline function get_r3c1():Float return this._13;
	private inline function set_r3c1(v:Float):Float return this._13 = v;

	/**
	 *  Accessor for the element in row 0 and column 2
	 */
	public var r0c2(get, set):Float;
	private inline function get_r0c2():Float return this._20;
	private inline function set_r0c2(v:Float):Float return this._20 = v;

	/**
	 *  Accessor for the element in row 1 and column 2
	 */
	public var r1c2(get, set):Float;
	private inline function get_r1c2():Float return this._21;
	private inline function set_r1c2(v:Float):Float return this._21 = v;

	/**
	 *  Accessor for the element in row 2 and column 2
	 */
	public var r2c2(get, set):Float;
	private inline function get_r2c2():Float return this._22;
	private inline function set_r2c2(v:Float):Float return this._22 = v;

	/**
	 *  Accessor for the element in row 3 and column 2
	 */
	public var r3c2(get, set):Float;
	private inline function get_r3c2():Float return this._23;
	private inline function set_r3c2(v:Float):Float return this._23 = v;

	/**
	 *  Accessor for the element in row 0 and column 3
	 */
	public var r0c3(get, set):Float;
	private inline function get_r0c3():Float return this._30;
	private inline function set_r0c3(v:Float):Float return this._30 = v;

	/**
	 *  Accessor for the element in row 1 and column 3
	 */
	public var r1c3(get, set):Float;
	private inline function get_r1c3():Float return this._31;
	private inline function set_r1c3(v:Float):Float return this._31 = v;

	/**
	 *  Accessor for the element in row 2 and column 3
	 */
	public var r2c3(get, set):Float;
	private inline function get_r2c3():Float return this._32;
	private inline function set_r2c3(v:Float):Float return this._32 = v;

	/**
	 *  Accessor for the element in row 3 and column 3
	 */
	public var r3c3(get, set):Float;
	private inline function get_r3c3():Float return this._33;
	private inline function set_r3c3(v:Float):Float return this._33 = v;

	@:arrayAccess
	public inline function get(key:Int) {
		return switch(key) {
            case  0: r0c0;
            case  1: r1c0;
            case  2: r2c0;
            case  3: r3c0;
            case  4: r0c1;
            case  5: r1c1;
            case  6: r2c1;
            case  7: r3c1;
            case  8: r0c2;
            case  9: r1c2;
            case 10: r2c2;
            case 11: r3c2;
            case 12: r0c3;
            case 13: r1c3;
            case 14: r2c3;
            case 15: r3c3;
            case _: throw 'Index ${key} out of bounds (0-15)!';
        };
	}

	@:arrayAccess
	public inline function arrayWrite(key:Int, value:Float):Float {
		return switch(key) {
            case  0: r0c0 = value;
            case  1: r1c0 = value;
            case  2: r2c0 = value;
            case  3: r3c0 = value;
            case  4: r0c1 = value;
            case  5: r1c1 = value;
            case  6: r2c1 = value;
            case  7: r3c1 = value;
            case  8: r0c2 = value;
            case  9: r1c2 = value;
            case 10: r2c2 = value;
            case 11: r3c2 = value;
            case 12: r0c3 = value;
            case 13: r1c3 = value;
            case 14: r2c3 = value;
            case 15: r3c3 = value;
            case _: throw 'Index ${key} out of bounds (0-15)!';
        };
	}

	/**
	 *  Tests if two matrices are equal on an element-by-element basis
	 *  @param m - the other matrix to check
	 *  @return Bool
	 */
	public inline function equals(b:Mat4):Bool {
        return !(
               Math.abs(r0c0 - b.r0c0) >= glm.GLM.EPSILON
            || Math.abs(r0c1 - b.r0c1) >= glm.GLM.EPSILON
            || Math.abs(r0c2 - b.r0c2) >= glm.GLM.EPSILON
            || Math.abs(r0c3 - b.r0c3) >= glm.GLM.EPSILON
            || Math.abs(r1c0 - b.r1c0) >= glm.GLM.EPSILON
            || Math.abs(r1c1 - b.r1c1) >= glm.GLM.EPSILON
            || Math.abs(r1c2 - b.r1c2) >= glm.GLM.EPSILON
            || Math.abs(r1c3 - b.r1c3) >= glm.GLM.EPSILON
            || Math.abs(r2c0 - b.r2c0) >= glm.GLM.EPSILON
            || Math.abs(r2c1 - b.r2c1) >= glm.GLM.EPSILON
            || Math.abs(r2c2 - b.r2c2) >= glm.GLM.EPSILON
            || Math.abs(r2c3 - b.r2c3) >= glm.GLM.EPSILON
            || Math.abs(r3c0 - b.r3c0) >= glm.GLM.EPSILON
            || Math.abs(r3c1 - b.r3c1) >= glm.GLM.EPSILON
            || Math.abs(r3c2 - b.r3c2) >= glm.GLM.EPSILON
            || Math.abs(r3c3 - b.r3c3) >= glm.GLM.EPSILON
        );
	}

	/**
	 *  Gets a string representation of the matrix
	 *  @return String
	 */
	public inline function toString():String {
		return
			'[${r0c0}, ${r0c1}, ${r0c2}, ${r0c3}]\n' +
			'[${r1c0}, ${r1c1}, ${r1c2}, ${r1c3}]\n' +
			'[${r2c0}, ${r2c1}, ${r2c2}, ${r2c3}]\n' +
			'[${r3c0}, ${r3c1}, ${r3c2}, ${r3c3}]\n';
	}

	/**
	 *  Fill `dest` with an identity matrix
	 *  @param dest - the matrix to fill out
	 *  @return Mat4
	 */
	public inline static function identity(dest:Mat4):Mat4 {
		dest.r0c0 = 1;
		dest.r0c1 = 0;
		dest.r0c2 = 0;
		dest.r0c3 = 0;

		dest.r1c0 = 0;
		dest.r1c1 = 1;
		dest.r1c2 = 0;
		dest.r1c3 = 0;
		
		dest.r2c0 = 0;
		dest.r2c1 = 0;
		dest.r2c2 = 1;
		dest.r2c3 = 0;
		
		dest.r3c0 = 0;
		dest.r3c1 = 0;
		dest.r3c2 = 0;
		dest.r3c3 = 1;

		return dest;
	}

	/**
	 *  Copies one matrix into another
	 *  @param src - The matrix to copy from
	 *  @param dest - The matrix to copy into
	 *  @return Mat4
	 */
	public inline static function copy(src:Mat4, dest:Mat4):Mat4 {
		dest.r0c0 = src.r0c0;
		dest.r0c1 = src.r0c1;
		dest.r0c2 = src.r0c2;
		dest.r0c3 = src.r0c3;
		
		dest.r1c0 = src.r1c0;
		dest.r1c1 = src.r1c1;
		dest.r1c2 = src.r1c2;
		dest.r1c3 = src.r1c3;
		
		dest.r2c0 = src.r2c0;
		dest.r2c1 = src.r2c1;
		dest.r2c2 = src.r2c2;
		dest.r2c3 = src.r2c3;
		
		dest.r3c0 = src.r3c0;
		dest.r3c1 = src.r3c1;
		dest.r3c2 = src.r3c2;
		dest.r3c3 = src.r3c3;

		return dest;
	}

	/**
	 *  Transposes a matrix
	 *  @param src - The matrix to transpose
	 *  @param dest - The destination matrix. Call with `src == dest` to modify `src` in place
	 *  @return Mat4
	 */
	public inline static function transpose(src:Mat4, dest:Mat4):Mat4 {
		var src_r1c0 = src.r1c0;
		var src_r2c0 = src.r2c0;
		var src_r2c1 = src.r2c1;
		var src_r3c0 = src.r3c0;
		var src_r3c1 = src.r3c1;
		var src_r3c2 = src.r3c2;

		dest.r0c0 = src.r0c0;
		dest.r1c0 = src.r0c1;
		dest.r2c0 = src.r0c2;
		dest.r3c0 = src.r0c3;

		dest.r0c1 = src_r1c0;
		dest.r1c1 = src.r1c1;
		dest.r2c1 = src.r1c2;
		dest.r3c1 = src.r1c3;

		dest.r0c2 = src_r2c0;
		dest.r1c2 = src_r2c1;
		dest.r2c2 = src.r2c2;
		dest.r3c2 = src.r2c3;

		dest.r0c3 = src_r3c0;
		dest.r1c3 = src_r3c1;
		dest.r2c3 = src_r3c2;
		dest.r3c3 = src.r3c3;

		return dest;
	}

	/**
	 *  Calculates the determinant of the matrix
	 *  @param src - The matrix to calculate the determinant of
	 *  @return Float
	 */
	public inline static function determinant(src:Mat4):Float {
		var a00:Float = src.r0c0, a01:Float = src.r1c0, a02:Float = src.r2c0, a03:Float = src.r3c0,
		    a10:Float = src.r0c1, a11:Float = src.r1c1, a12:Float = src.r2c1, a13:Float = src.r3c1,
		    a20:Float = src.r0c2, a21:Float = src.r1c2, a22:Float = src.r2c2, a23:Float = src.r3c2,
		    a30:Float = src.r0c3, a31:Float = src.r1c3, a32:Float = src.r2c3, a33:Float = src.r3c3;

		var b00:Float = a00 * a11 - a01 * a10,
		    b01:Float = a00 * a12 - a02 * a10,
		    b02:Float = a00 * a13 - a03 * a10,
		    b03:Float = a01 * a12 - a02 * a11,
		    b04:Float = a01 * a13 - a03 * a11,
		    b05:Float = a02 * a13 - a03 * a12,
		    b06:Float = a20 * a31 - a21 * a30,
		    b07:Float = a20 * a32 - a22 * a30,
		    b08:Float = a20 * a33 - a23 * a30,
		    b09:Float = a21 * a32 - a22 * a31,
		    b10:Float = a21 * a33 - a23 * a31,
		    b11:Float = a22 * a33 - a23 * a32;

		return b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;
	}

	/**
	 *  Inverts the `src` matrix, storing the result in `dest`. If `src == dest`, modifies `src` in place.
	 *  @param src - The source matrix
	 *  @param dest - The matrix to store the result in
	 *  @return Mat4
	 */
	public inline static function invert(src:Mat4, dest:Mat4):Mat4 {
		var a00:Float = src.r0c0, a01:Float = src.r0c1, a02:Float = src.r0c2, a03:Float = src.r0c3;
		var a10:Float = src.r1c0, a11:Float = src.r1c1, a12:Float = src.r1c2, a13:Float = src.r1c3;
		var a20:Float = src.r2c0, a21:Float = src.r2c1, a22:Float = src.r2c2, a23:Float = src.r2c3;
		var a30:Float = src.r3c0, a31:Float = src.r3c1, a32:Float = src.r3c2, a33:Float = src.r3c3;

		var t00:Float = a12 * a23 * a31 - a13 * a22 * a31 + a13 * a21 * a32 - a11 * a23 * a32 - a12 * a21 * a33 + a11 * a22 * a33;
		var t01:Float = a03 * a22 * a31 - a02 * a23 * a31 - a03 * a21 * a32 + a01 * a23 * a32 + a02 * a21 * a33 - a01 * a22 * a33;
		var t02:Float = a02 * a13 * a31 - a03 * a12 * a31 + a03 * a11 * a32 - a01 * a13 * a32 - a02 * a11 * a33 + a01 * a12 * a33;
		var t03:Float = a03 * a12 * a21 - a02 * a13 * a21 - a03 * a11 * a22 + a01 * a13 * a22 + a02 * a11 * a23 - a01 * a12 * a23;

		var det:Float = a00 * t00 + a10 * t01 + a20 * t02 + a30 * t03;
		if (Math.abs(det) <= glm.GLM.EPSILON) {
			throw 'Can\'t invert matrix, det (${det}) is too small!';
		}
		var idet:Float = 1 / det;

		dest.r0c0 = t00 * idet;
		dest.r1c0 = (a13 * a22 * a30 - a12 * a23 * a30 - a13 * a20 * a32 + a10 * a23 * a32 + a12 * a20 * a33 - a10 * a22 * a33) * idet;
		dest.r2c0 = (a11 * a23 * a30 - a13 * a21 * a30 + a13 * a20 * a31 - a10 * a23 * a31 - a11 * a20 * a33 + a10 * a21 * a33) * idet;
		dest.r3c0 = (a12 * a21 * a30 - a11 * a22 * a30 - a12 * a20 * a31 + a10 * a22 * a31 + a11 * a20 * a32 - a10 * a21 * a32) * idet;

		dest.r0c1 = t01 * idet;
		dest.r1c1 = (a02 * a23 * a30 - a03 * a22 * a30 + a03 * a20 * a32 - a00 * a23 * a32 - a02 * a20 * a33 + a00 * a22 * a33) * idet;
		dest.r2c1 = (a03 * a21 * a30 - a01 * a23 * a30 - a03 * a20 * a31 + a00 * a23 * a31 + a01 * a20 * a33 - a00 * a21 * a33) * idet;
		dest.r3c1 = (a01 * a22 * a30 - a02 * a21 * a30 + a02 * a20 * a31 - a00 * a22 * a31 - a01 * a20 * a32 + a00 * a21 * a32) * idet;

		dest.r0c2 = t02 * idet;
		dest.r1c2 = (a03 * a12 * a30 - a02 * a13 * a30 - a03 * a10 * a32 + a00 * a13 * a32 + a02 * a10 * a33 - a00 * a12 * a33) * idet;
		dest.r2c2 = (a01 * a13 * a30 - a03 * a11 * a30 + a03 * a10 * a31 - a00 * a13 * a31 - a01 * a10 * a33 + a00 * a11 * a33) * idet;
		dest.r3c2 = (a02 * a11 * a30 - a01 * a12 * a30 - a02 * a10 * a31 + a00 * a12 * a31 + a01 * a10 * a32 - a00 * a11 * a32) * idet;

		dest.r0c3 = t03 * idet;
		dest.r1c3 = (a02 * a13 * a20 - a03 * a12 * a20 + a03 * a10 * a22 - a00 * a13 * a22 - a02 * a10 * a23 + a00 * a12 * a23) * idet;
		dest.r2c3 = (a03 * a11 * a20 - a01 * a13 * a20 - a03 * a10 * a21 + a00 * a13 * a21 + a01 * a10 * a23 - a00 * a11 * a23) * idet;
		dest.r3c3 = (a01 * a12 * a20 - a02 * a11 * a20 + a02 * a10 * a21 - a00 * a12 * a21 - a01 * a10 * a22 + a00 * a11 * a22) * idet;
		return dest;
	}

	/**
	 *  Multiplies two matrices together, storing the result in `dest`. Caches `a` and `b` so `a == dest` and `b == dest` are valid.
	 *  @param a - The left-hand matrix
	 *  @param b - The right-hand matrix
	 *  @param dest - The matrix to store the result in
	 *  @return Mat4
	 */
	public inline static function multMat(a:Mat4, b:Mat4, dest:Mat4):Mat4 {
		// cache what we need to do the calculations
		var _a:Mat4;
		var _b:Mat4;
		if(dest == a) {
			_a = Mat4.copy(a, new Mat4());
			_b = b;
		}
		else if(dest == b) {
			_a = a;
			_b = Mat4.copy(b, new Mat4());
		}
		else {
			_a = a;
			_b = b;
		}

		dest.r0c0 = _a.r0c0*_b.r0c0 + _a.r0c1*_b.r1c0 + _a.r0c2*_b.r2c0 + _a.r0c3*_b.r3c0;
		dest.r0c1 = _a.r0c0*_b.r0c1 + _a.r0c1*_b.r1c1 + _a.r0c2*_b.r2c1 + _a.r0c3*_b.r3c1;
		dest.r0c2 = _a.r0c0*_b.r0c2 + _a.r0c1*_b.r1c2 + _a.r0c2*_b.r2c2 + _a.r0c3*_b.r3c2;
		dest.r0c3 = _a.r0c0*_b.r0c3 + _a.r0c1*_b.r1c3 + _a.r0c2*_b.r2c3 + _a.r0c3*_b.r3c3;

		dest.r1c0 = _a.r1c0*_b.r0c0 + _a.r1c1*_b.r1c0 + _a.r1c2*_b.r2c0 + _a.r1c3*_b.r3c0;
		dest.r1c1 = _a.r1c0*_b.r0c1 + _a.r1c1*_b.r1c1 + _a.r1c2*_b.r2c1 + _a.r1c3*_b.r3c1;
		dest.r1c2 = _a.r1c0*_b.r0c2 + _a.r1c1*_b.r1c2 + _a.r1c2*_b.r2c2 + _a.r1c3*_b.r3c2;
		dest.r1c3 = _a.r1c0*_b.r0c3 + _a.r1c1*_b.r1c3 + _a.r1c2*_b.r2c3 + _a.r1c3*_b.r3c3;

		dest.r2c0 = _a.r2c0*_b.r0c0 + _a.r2c1*_b.r1c0 + _a.r2c2*_b.r2c0 + _a.r2c3*_b.r3c0;
		dest.r2c1 = _a.r2c0*_b.r0c1 + _a.r2c1*_b.r1c1 + _a.r2c2*_b.r2c1 + _a.r2c3*_b.r3c1;
		dest.r2c2 = _a.r2c0*_b.r0c2 + _a.r2c1*_b.r1c2 + _a.r2c2*_b.r2c2 + _a.r2c3*_b.r3c2;
		dest.r2c3 = _a.r2c0*_b.r0c3 + _a.r2c1*_b.r1c3 + _a.r2c2*_b.r2c3 + _a.r2c3*_b.r3c3;

		dest.r3c0 = _a.r3c0*_b.r0c0 + _a.r3c1*_b.r1c0 + _a.r3c2*_b.r2c0 + _a.r3c3*_b.r3c0;
		dest.r3c1 = _a.r3c0*_b.r0c1 + _a.r3c1*_b.r1c1 + _a.r3c2*_b.r2c1 + _a.r3c3*_b.r3c1;
		dest.r3c2 = _a.r3c0*_b.r0c2 + _a.r3c1*_b.r1c2 + _a.r3c2*_b.r2c2 + _a.r3c3*_b.r3c2;
		dest.r3c3 = _a.r3c0*_b.r0c3 + _a.r3c1*_b.r1c3 + _a.r3c2*_b.r2c3 + _a.r3c3*_b.r3c3;
		
		return dest;
	}

	/**
	 *  Shortcut operator for `multMat(a, b, new Mat4())`
	 *  @param a - 
	 *  @param b - 
	 *  @return Mat4
	 */
	@:op(A * B)
	public inline static function multMatOp(a:Mat4, b:Mat4):Mat4 {
		return multMat(a, b, new Mat4());
	}

	/**
	 *  Multiplies a vector `v` by a matrix `m`, storing the result in `dest`. Caches so `v == dest` is valid.
	 *  @param m - The transforming matrix
	 *  @param v - The vector to multiply with
	 *  @param dest - The resulting vector
	 *  @return Vec4
	 */
	public inline static function multVec(m:Mat4, v:Vec4, dest:Vec4):Vec4 {
		var x:Float = v.x, y:Float = v.y, z:Float = v.z, w:Float = v.w;
		dest.x = m.r0c0*x + m.r0c1*y + m.r0c2*z + m.r0c3*w;
		dest.y = m.r1c0*x + m.r1c1*y + m.r1c2*z + m.r1c3*w;
		dest.z = m.r2c0*x + m.r2c1*y + m.r2c2*z + m.r2c3*w;
		dest.w = m.r3c0*x + m.r3c1*y + m.r3c2*z + m.r3c3*w;
		return dest;
	}

	/**
	 *  Shortcut for `multVec(m, v, new Vec4())`
	 *  @param m - 
	 *  @param v - 
	 *  @return Vec4
	 */
	@:op(A * B)
	public inline static function multVecOp(m:Mat4, v:Vec4):Vec4 {
		return multVec(m, v, new Vec4());
	}

    /**
     *  Construct a Mat4 from an array of floats in column-major order
     *  @param arr an array with 16 elements
     *  @return Mat4
     */
    @:from
    public inline static function fromFloatArray(arr:Array<Float>):Mat4 {
        return new Mat4(
			arr[ 0], arr[ 4], arr[ 8], arr[12],
			arr[ 1], arr[ 5], arr[ 9], arr[13],
			arr[ 2], arr[ 6], arr[10], arr[14],
			arr[ 3], arr[ 7], arr[11], arr[15]
		);
    }

	/**
	 *  Cast the matrix in an array of floats, in column-major order
	 *  @return Array<Float>
	 */
	@:to
	public inline function toFloatArray():Array<Float> {
		return [
			r0c0, r1c0, r2c0, r3c0,
			r0c1, r1c1, r2c1, r3c1,
			r0c2, r1c2, r2c2, r3c2,
			r0c3, r1c3, r2c3, r3c3
		];
	}
}