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
     *  @param translation - How far to move in each of the directions
     *  @param dest - Where the result will be stored
     *  @return Mat4
     */
    public inline static function translate(translation:Vec3, dest:Mat4):Mat4 {
        dest.identity();
        dest.r0c3 = translation.x;
        dest.r1c3 = translation.y;
        dest.r2c3 = translation.z;
        return dest;
    }

    /**
     *  Constructs a 3D rotation matrix
     *  @param rotation - The quaternion to use as rotation
     *  @param dest - Where the result will be stored
     *  @return Mat4
     */
    public inline function rotate(rotation:Quat, dest:Mat4):Mat4 {
        var x2:Float = rotation.x+rotation.x, y2:Float = rotation.y+rotation.y, z2:Float = rotation.z+rotation.z;
		var xx:Float = rotation.x * x2, xy:Float = rotation.x * y2, xz:Float = rotation.x * z2;
		var yy:Float = rotation.y * y2, yz:Float = rotation.y * z2, zz:Float = rotation.z * z2;
		var wx:Float = rotation.w * x2, wy:Float = rotation.w * y2, wz:Float = rotation.w * z2;

        dest.r0c0 = 1 - (yy + zz);
        dest.r0c1 = xy - wz;
        dest.r0c2 = xz + wy;
        dest.r0c3 = 0;

        dest.r1c0 = xy + wz;
        dest.r1c1 = 1 - (xx + zz);
        dest.r1c2 = yz - wx;
        dest.r1c3 = 0;
        
        dest.r2c0 = xz - wy;
        dest.r2c1 = yz + wx;
        dest.r2c2 = 1 - (xx + yy);
        dest.r2c3 = 0;

        dest.r3c0 = 0;
        dest.r3c1 = 0;
        dest.r3c2 = 0;
        dest.r3c3 = 1;
        return dest;
    }

    /**
     *  Constructs a 3D scale matrix
     *  @param amount - How much to scale by in each of the three directions
     *  @param dest - Where the result will be stored
     *  @return Mat4
     */
    public inline static function scale(amount:Vec3, dest:Mat4):Mat4 {
        dest.identity();
        dest.r0c0 = amount.x;
        dest.r1c1 = amount.y;
        dest.r2c2 = amount.z;
        return dest;
    }

    /**
     *  Constructs a complete transformation matrix from translation, rotation, and scale components.
     *  It should be a fair bit faster than constructing each on their own and multiplying together.
     *  @param translation - The translation vector
     *  @param rotation - The rotation quaternion
     *  @param scale - The scale vector
     *  @param dest - Where to store the result
     *  @return Mat4
     */
    public inline static function transform(translation:Vec3, rotation:Quat, scale:Vec3, dest:Mat4):Mat4 {
        var x2:Float = rotation.x + rotation.x;
        var y2:Float = rotation.y + rotation.y;
        var z2:Float = rotation.z + rotation.z;

        var xx:Float = rotation.x * x2;
        var xy:Float = rotation.x * y2;
        var xz:Float = rotation.x * z2;
        var yy:Float = rotation.y * y2;
        var yz:Float = rotation.y * z2;
        var zz:Float = rotation.z * z2;
        var wx:Float = rotation.w * x2;
        var wy:Float = rotation.w * y2;
        var wz:Float = rotation.w * z2;

        dest.r0c0 = (1 - (yy + zz)) * scale.x;
        dest.r1c0 = (xy + wz) * scale.x;
        dest.r2c0 = (xz - wy) * scale.x;
        dest.r3c0 = 0;
        dest.r0c1 = (xy - wz) * scale.y;
        dest.r1c1 = (1 - (xx + zz)) * scale.y;
        dest.r2c1 = (yz + wx) * scale.y;
        dest.r3c1 = 0;
        dest.r0c2 = (xz + wy) * scale.z;
        dest.r1c2 = (yz - wx) * scale.z;
        dest.r2c2 = (1 - (xx + yy)) * scale.z;
        dest.r3c2 = 0;
        dest.r0c3 = translation.x;
        dest.r1c3 = translation.y;
        dest.r2c3 = translation.z;
        dest.r3c3 = 1;
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