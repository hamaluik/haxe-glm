package glm;

class Mat4Tools {
    public inline static function multiplyMatrix(a:Mat4, b:Mat4):Mat4 {
        return new Mat4(
            a.e00 * b.e00 + a.e10 * b.e01 + a.e20 * b.e02 + a.e30 * b.e03,
            a.e00 * b.e10 + a.e10 * b.e11 + a.e20 * b.e12 + a.e30 * b.e13,
            a.e00 * b.e20 + a.e10 * b.e21 + a.e20 * b.e22 + a.e30 * b.e23,
            a.e00 * b.e30 + a.e10 * b.e31 + a.e20 * b.e32 + a.e30 * b.e33,

            a.e01 * b.e00 + a.e11 * b.e01 + a.e21 * b.e02 + a.e31 * b.e03,
            a.e01 * b.e10 + a.e11 * b.e11 + a.e21 * b.e12 + a.e31 * b.e13,
            a.e01 * b.e20 + a.e11 * b.e21 + a.e21 * b.e22 + a.e31 * b.e23,
            a.e01 * b.e30 + a.e11 * b.e31 + a.e21 * b.e32 + a.e31 * b.e33,

            a.e02 * b.e00 + a.e12 * b.e01 + a.e22 * b.e02 + a.e32 * b.e03,
            a.e02 * b.e10 + a.e12 * b.e11 + a.e22 * b.e12 + a.e32 * b.e13,
            a.e02 * b.e20 + a.e12 * b.e21 + a.e22 * b.e22 + a.e32 * b.e23,
            a.e02 * b.e30 + a.e12 * b.e31 + a.e22 * b.e32 + a.e32 * b.e33,

            a.e03 * b.e00 + a.e13 * b.e01 + a.e23 * b.e02 + a.e33 * b.e03,
            a.e03 * b.e10 + a.e13 * b.e11 + a.e23 * b.e12 + a.e33 * b.e13,
            a.e03 * b.e20 + a.e13 * b.e21 + a.e23 * b.e22 + a.e33 * b.e23,
            a.e03 * b.e30 + a.e13 * b.e31 + a.e23 * b.e32 + a.e33 * b.e33);
    }

    public inline static function multiplyVector(mat:Mat4, vec:Vec4):Vec4 {
        // TODO
        return vec;
    }

    public inline static function transpose(mat:Mat4):Mat4 {
        return new Mat4(
            mat.e00, mat.e01, mat.e02, mat.e03,
            mat.e10, mat.e11, mat.e12, mat.e13,
            mat.e20, mat.e21, mat.e22, mat.e23,
            mat.e30, mat.e31, mat.e32, mat.e33
        );
    }

    public inline static function invert(mat:Mat4):Mat4 {
        var coef00:Float = mat.e22 * mat.e33 - mat.e32 * mat.e23;
        var coef02:Float = mat.e12 * mat.e33 - mat.e32 * mat.e13;
        var coef03:Float = mat.e12 * mat.e23 - mat.e22 * mat.e13;

        var coef04:Float = mat.e21 * mat.e33 - mat.e31 * mat.e23;
        var coef06:Float = mat.e11 * mat.e33 - mat.e31 * mat.e13;
        var coef07:Float = mat.e11 * mat.e23 - mat.e21 * mat.e13;

        var coef08:Float = mat.e21 * mat.e32 - mat.e31 * mat.e22;
        var coef10:Float = mat.e11 * mat.e32 - mat.e31 * mat.e12;
        var coef11:Float = mat.e11 * mat.e22 - mat.e21 * mat.e12;

        var coef12:Float = mat.e20 * mat.e33 - mat.e30 * mat.e23;
        var coef14:Float = mat.e10 * mat.e33 - mat.e30 * mat.e13;
        var coef15:Float = mat.e10 * mat.e23 - mat.e20 * mat.e13;

        var coef16:Float = mat.e20 * mat.e32 - mat.e30 * mat.e22;
        var coef18:Float = mat.e10 * mat.e32 - mat.e30 * mat.e12;
        var coef19:Float = mat.e10 * mat.e22 - mat.e20 * mat.e12;

        var coef20:Float = mat.e20 * mat.e31 - mat.e30 * mat.e21;
        var coef22:Float = mat.e10 * mat.e31 - mat.e30 * mat.e11;
        var coef23:Float = mat.e10 * mat.e21 - mat.e20 * mat.e11;

        var fac0:Vec4 = new Vec4(coef00, coef00, coef02, coef03);
        var fac1:Vec4 = new Vec4(coef04, coef04, coef06, coef07);
        var fac2:Vec4 = new Vec4(coef08, coef08, coef10, coef11);
        var fac3:Vec4 = new Vec4(coef12, coef12, coef14, coef15);
        var fac4:Vec4 = new Vec4(coef16, coef16, coef18, coef19);
        var fac5:Vec4 = new Vec4(coef20, coef20, coef22, coef23);

        var vec0:Vec4 = new Vec4(mat.e10, mat.e00, mat.e00, mat.e00);
        var vec1:Vec4 = new Vec4(mat.e11, mat.e01, mat.e01, mat.e01);
        var vec2:Vec4 = new Vec4(mat.e12, mat.e02, mat.e02, mat.e02);
        var vec3:Vec4 = new Vec4(mat.e13, mat.e03, mat.e03, mat.e03);

        var inv0:Vec4 = Vec4.multiplyComponents(vec1, fac0).subtractVec4(Vec4.multiplyComponents(vec2, fac1)).addVec4(Vec4.multiplyComponents(vec3, fac2));
        var inv1:Vec4 = Vec4.multiplyComponents(vec0, fac0).subtractVec4(Vec4.multiplyComponents(vec2, fac3)).addVec4(Vec4.multiplyComponents(vec3, fac4));
        var inv2:Vec4 = Vec4.multiplyComponents(vec0, fac1).subtractVec4(Vec4.multiplyComponents(vec1, fac3)).addVec4(Vec4.multiplyComponents(vec3, fac5));
        var inv3:Vec4 = Vec4.multiplyComponents(vec0, fac2).subtractVec4(Vec4.multiplyComponents(vec1, fac4)).addVec4(Vec4.multiplyComponents(vec2, fac5));

        var signA:Vec4 = new Vec4(+1, -1, +1, -1);
        var signB:Vec4 = new Vec4(-1, +1, -1, +1);

        var invCol0:Vec4 = Vec4.multiplyComponents(inv0, signA);
        var invCol1:Vec4 = Vec4.multiplyComponents(inv1, signB);
        var invCol2:Vec4 = Vec4.multiplyComponents(inv2, signA);
        var invCol3:Vec4 = Vec4.multiplyComponents(inv3, signB);

        var inverse:Mat4 = new Mat4(
            invCol0.x, invCol1.x, invCol2.x, invCol3.x,
            invCol0.y, invCol1.y, invCol2.y, invCol3.y,
            invCol0.z, invCol1.z, invCol2.z, invCol3.z,
            invCol0.w, invCol1.w, invCol2.w, invCol3.w
        );

        var row0:Vec4 = new Vec4(inverse.e00, inverse.e10, inverse.e20, inverse.e30);
        
        // TODO

        return inverse;
    }
}