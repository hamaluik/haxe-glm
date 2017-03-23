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

    /**
     *  Constructs a perspective projection matrix
     *  Taken from https://github.com/toji/gl-matrix/blob/master/src/gl-matrix/mat4.js#L1788
     *  @param fovy - The vertical field of view in radians
     *  @param aspectRatio - The aspect ratio of the view
     *  @param near - The near clipping plane
     *  @param far - The far clipping plane
     *  @param dest - Where to store the result
     *  @return Mat4
     */
    public inline static function perspective(fovy:Float, aspectRatio:Float, near:Float, far:Float, dest:Mat4):Mat4 {
        var f:Float = 1 / Math.tan(fovy / 2);
        var nf:Float = 1 / (near - far);

        dest.r0c0 = f / aspectRatio;
        dest.r1c0 = 0;
        dest.r2c0 = 0;
        dest.r3c0 = 0;

        dest.r0c1 = 0;
        dest.r1c1 = f;
        dest.r2c1 = 0;
        dest.r3c1 = 0;
        
        dest.r0c2 = 0;
        dest.r1c2 = 0;
        dest.r2c2 = (far + near) * nf;
        dest.r3c2 = -1;

        dest.r0c3 = 0;
        dest.r1c3 = 0;
        dest.r2c3 = (2 * far * near) * nf;
        dest.r3c3 = 0;
        return dest;
    }

    /**
     *  Constructs an orthographic projection matrix
     *  Taken from: https://github.com/toji/gl-matrix/blob/master/src/gl-matrix/mat4.js#L1860
     *  @param left - 
     *  @param right - 
     *  @param bottom - 
     *  @param top - 
     *  @param near - 
     *  @param far - 
     *  @param dest - Where to store the result
     *  @return Mat4
     */
    public inline static function orthographic(left:Float, right:Float, bottom:Float, top:Float, near:Float=-1, far:Float=1, dest:Mat4):Mat4 {
        var lr:Float = 1 / (left - right);
        var bt:Float = 1 / (bottom - top);
        var nf:Float = 1 / (near - far);

        dest.r0c0 = -2 * lr;
        dest.r1c0 = 0;
        dest.r2c0 = 0;
        dest.r3c0 = 0;

        dest.r0c1 = 0;
        dest.r1c1 = -2 * bt;
        dest.r2c1 = 0;
        dest.r3c1 = 0;
        
        dest.r0c2 = 0;
        dest.r1c2 = 0;
        dest.r2c2 = 2 * nf;
        dest.r3c2 = 0;

        dest.r0c3 = (left + right) * lr;
        dest.r1c3 = (top + bottom) * bt;
        dest.r2c3 = (far + near) * nf;
        dest.r3c3 = 1;
        return dest;
    }

    /**
     *  Constructs an orthographic projection matrix
     *  Taken from: https://github.com/toji/gl-matrix/blob/master/src/gl-matrix/mat4.js#L1755
     *  @param left - 
     *  @param right - 
     *  @param bottom - 
     *  @param top - 
     *  @param near - 
     *  @param far - 
     *  @param dest - Where to store the result
     *  @return Mat4
     */
    public inline static function frustum(left:Float, right:Float, bottom:Float, top:Float, near:Float=-1, far:Float=1, dest:Mat4):Mat4 {
        var rl:Float = 1 / (right - left);
        var tb:Float = 1 / (top - bottom);
        var nf:Float = 1 / (near - far);

        dest.r0c0 = (near * 2) * rl;
        dest.r1c0 = 0;
        dest.r2c0 = 0;
        dest.r3c0 = 0;

        dest.r0c1 = 0;
        dest.r1c1 = (near * 2) * tb;
        dest.r2c1 = 0;
        dest.r3c1 = 0;
        
        dest.r0c2 = (right + left) * tb;
        dest.r1c2 = (top + bottom) * tb;
        dest.r2c2 = (far + near) * nf;
        dest.r3c2 = -1;

        dest.r0c3 = 0;
        dest.r1c3 = 0;
        dest.r2c3 = (far * near * 2) * nf;
        dest.r3c3 = 0;
        return dest;
    }
}