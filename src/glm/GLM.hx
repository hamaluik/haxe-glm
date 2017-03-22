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

using glm.Mat4;
using glm.Vec4;

#if js
typedef FloatArray = js.html.Float32Array;
#else
typedef FloatArray = haxe.io.Float32Array;
#end

class GLM {
    /**
     *  Minimum absolute value difference of floats before they are considered equal
     */
    public static var EPSILON:Float = 0.0000001;

    /**
     *  Utility for linearly interpolating between two values
     *  @param a - The value when `t == 0`
     *  @param b - The value when `t == 1`
     *  @param t - A value between `0` and `1`, not clamped by the function
     *  @return Float
     */
    public inline static function lerp(a:Float, b:Float, t:Float):Float {
        return a + t * (b - a);
    }

    /**
     *  Constructs a 3D translation matrix
     *  @param x - How far to move in the `x` direction
     *  @param y - How far to move in the `y` direction
     *  @param z - How far to move in the `z` direction
     *  @param dest - Where the result will be stored
     *  @return Mat4
     */
    public inline static function translate(x:Float, y:Float, z:Float, dest:Mat4):Mat4 {
        dest.identity();
        dest.r0c3 = x;
        dest.r1c3 = y;
        dest.r2c3 = z;
        return dest;
    }

    /**
     *  Constructs a 3D scale matrix
     *  @param x - How much to scale in the x direction by
     *  @param y - How much to scale in the y direction by
     *  @param z - How much to scale in the z direction by
     *  @param dest - Where the result will be stored
     *  @return Mat4
     */
    public inline static function scale(x:Float, y:Float, z:Float, dest:Mat4):Mat4 {
        dest.identity();
        dest.r0c0 = x;
        dest.r1c1 = y;
        dest.r2c2 = z;
        return dest;
    }
}