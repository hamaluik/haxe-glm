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

import haxe.io.Float32Array;

abstract Mat3(Float32Array) {
	public inline function new(
			_r0c0:Float = 0, _r0c1:Float = 0, _r0c2:Float = 0,
			_r1c0:Float = 0, _r1c1:Float = 0, _r1c2:Float = 0,
			_r2c0:Float = 0, _r2c1:Float = 0, _r2c2:Float = 0) {
		this = new Float32Array(16);
		r0c0 = _r0c0;
		r1c0 = _r1c0;
		r2c0 = _r2c0;

		r0c1 = _r0c1;
		r1c1 = _r1c1;
		r2c1 = _r2c1;

		r0c2 = _r0c2;
		r1c2 = _r1c2;
		r2c2 = _r2c2;
	}

	/**
	 *  Accessor for the element in row 0 and column 0
	 */
	public var r0c0(get, set):Float;
	private inline function get_r0c0():Float return this[0];
	private inline function set_r0c0(v:Float):Float return this[0] = v;

	/**
	 *  Accessor for the element in row 1 and column 0
	 */
	public var r1c0(get, set):Float;
	private inline function get_r1c0():Float return this[1];
	private inline function set_r1c0(v:Float):Float return this[1] = v;

	/**
	 *  Accessor for the element in row 2 and column 0
	 */
	public var r2c0(get, set):Float;
	private inline function get_r2c0():Float return this[2];
	private inline function set_r2c0(v:Float):Float return this[2] = v;

	/**
	 *  Accessor for the element in row 0 and column 1
	 */
	public var r0c1(get, set):Float;
	private inline function get_r0c1():Float return this[4];
	private inline function set_r0c1(v:Float):Float return this[4] = v;

	/**
	 *  Accessor for the element in row 1 and column 1
	 */
	public var r1c1(get, set):Float;
	private inline function get_r1c1():Float return this[5];
	private inline function set_r1c1(v:Float):Float return this[5] = v;

	/**
	 *  Accessor for the element in row 2 and column 1
	 */
	public var r2c1(get, set):Float;
	private inline function get_r2c1():Float return this[6];
	private inline function set_r2c1(v:Float):Float return this[6] = v;

	/**
	 *  Accessor for the element in row 0 and column 2
	 */
	public var r0c2(get, set):Float;
	private inline function get_r0c2():Float return this[8];
	private inline function set_r0c2(v:Float):Float return this[8] = v;

	/**
	 *  Accessor for the element in row 1 and column 2
	 */
	public var r1c2(get, set):Float;
	private inline function get_r1c2():Float return this[9];
	private inline function set_r1c2(v:Float):Float return this[9] = v;

	/**
	 *  Accessor for the element in row 2 and column 2
	 */
	public var r2c2(get, set):Float;
	private inline function get_r2c2():Float return this[10];
	private inline function set_r2c2(v:Float):Float return this[10] = v;

	@:arrayAccess
	public inline function get(key:Int) {
		return this[key];
	}

	@:arrayAccess
	public inline function arrayWrite(key:Int, value:Float):Float {
		return this[key] = value;
	}

	/**
	 *  Tests if two matrices are equal on an element-by-element basis
	 *  @param m - the other matrix to check
	 *  @return Bool
	 */
	public inline function equals(b:Mat3):Bool {
		var equal:Bool = true;
		for(i in 0...9) {
			if(Math.abs(this[i] - b[i]) >= glm.GLM.EPSILON) {
				equal = false;
				break;
			}
		}
		return equal;
	}

	/**
	 *  Gets a string representation of the matrix
	 *  @return String
	 */
	public inline function toString():String {
		return
			'[${this[0]}, ${this[3]}, ${this[6]}]\n' +
			'[${this[1]}, ${this[4]}, ${this[7]}]\n' +
			'[${this[2]}, ${this[5]}, ${this[8]}]\n';
	}

	/**
	 *  Fill `dest` with an identity matrix
	 *  @param dest - the matrix to fill out
	 *  @return Mat3
	 */
	public inline static function identity(dest:Mat3):Mat3 {
		dest.r0c0 = 1;
		dest.r0c1 = 0;
		dest.r0c2 = 0;

		dest.r1c0 = 0;
		dest.r1c1 = 1;
		dest.r1c2 = 0;
		
		dest.r2c0 = 0;
		dest.r2c1 = 0;
		dest.r2c2 = 1;

		return dest;
	}

	/**
	 *  Copies one matrix into another
	 *  @param src - The matrix to copy from
	 *  @param dest - The matrix to copy into
	 *  @return Mat3
	 */
	public inline static function copy(src:Mat3, dest:Mat3):Mat3 {
		dest[0] = src[0];
		dest[1] = src[1];
		dest[2] = src[2];
		dest[3] = src[3];
		dest[4] = src[4];
		dest[5] = src[5];
		dest[6] = src[6];
		dest[7] = src[7];
		dest[8] = src[8];
		return dest;
	}

	/**
	 *  Transposes a matrix
	 *  @param src - The matrix to transpose
	 *  @param dest - The destination matrix. Call with `src == dest` to modify `src` in place
	 *  @return Mat3
	 */
	public inline static function transpose(src:Mat3, dest:Mat3):Mat3 {
		// TODO:
		return dest;
	}

	/**
	 *  Calculates the determinant of the matrix
	 *  @param src - The matrix to calculate the determinant of
	 *  @return Float
	 */
	public inline static function determinant(src:Mat3):Float {
		// TODO:
		return 0;
	}

	/**
	 *  Inverts the `src` matrix, storing the result in `dest`. If `src == dest`, modifies `src` in place.
	 *  @param src - The source matrix
	 *  @param dest - The matrix to store the result in
	 *  @return Mat3
	 */
	public inline static function invert(src:Mat3, dest:Mat3):Mat3 {
		// TODO:
		return dest;
	}

	/**
	 *  Multiplies two matrices together, storing the result in `dest`. Caches `a` and `b` so `a == dest` and `b == dest` are valid.
	 *  @param a - The left-hand matrix
	 *  @param b - The right-hand matrix
	 *  @param dest - The matrix to store the result in
	 *  @return Mat3
	 */
	public inline static function multMat(a:Mat3, b:Mat3, dest:Mat3):Mat3 {
		// TODO:
		return dest;
	}

	/**
	 *  Shortcut operator for `multMat(a, b, new Mat3())`
	 *  @param a - 
	 *  @param b - 
	 *  @return Mat3
	 */
	@:op(A * B)
	public inline static function multMatOp(a:Mat3, b:Mat3):Mat3 {
		return multMat(a, b, new Mat3());
	}

	/**
	 *  Multiplies a vector `v` by a matrix `m`, storing the result in `dest`. Caches so `v == dest` is valid.
	 *  @param m - The transforming matrix
	 *  @param v - The vector to multiply with
	 *  @param dest - The resulting vector
	 *  @return Vec3
	 */
	public inline static function multVec(m:Mat3, v:Vec3, dest:Vec3):Vec3 {
		var x:Float = v.x, y:Float = v.y, z:Float = v.z;
		dest.x = m.r0c0*x + m.r0c1*y + m.r0c2*z;
		dest.y = m.r1c0*x + m.r1c1*y + m.r1c2*z;
		dest.z = m.r2c0*x + m.r2c1*y + m.r2c2*z;
		return dest;
	}

	/**
	 *  Shortcut for `multVec(m, v, new Vec3())`
	 *  @param m - 
	 *  @param v - 
	 *  @return Vec3
	 */
	@:op(A * B)
	public inline static function multVecOp(m:Mat3, v:Vec3):Vec3 {
		return multVec(m, v, new Vec3());
	}

    /**
     *  Construct a Mat3 from an array of floats in column-major order
     *  @param arr an array with 16 elements
     *  @return Mat3
     */
    @:from
    public inline static function fromFloat32Array(arr:Array<Float>):Mat3 {
        return new Mat3(
			arr[0], arr[3], arr[6],
			arr[1], arr[4], arr[7],
			arr[2], arr[5], arr[8]
		);
    }

	/**
	 *  Cast the matrix in an array of floats, in column-major order
	 *  @return Array<Float>
	 */
	@:to
	public inline function toFloat32Array():Array<Float> {
		return [
			r0c0, r1c0, r2c0,
			r0c1, r1c1, r2c1,
			r0c2, r1c2, r2c2,
		];
	}
}