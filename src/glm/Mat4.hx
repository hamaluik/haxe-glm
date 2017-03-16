package glm;

class Mat4 {
    // element access is column-major
    public var e00:Float; public var e10:Float; public var e20:Float; public var e30:Float;
    public var e01:Float; public var e11:Float; public var e21:Float; public var e31:Float;
    public var e02:Float; public var e12:Float; public var e22:Float; public var e32:Float;
    public var e03:Float; public var e13:Float; public var e23:Float; public var e33:Float;

    public inline function new(
            e00:Float = 0, e10:Float = 0, e20:Float = 0, e30:Float = 0,
            e01:Float = 0, e11:Float = 0, e21:Float = 0, e31:Float = 0,
            e02:Float = 0, e12:Float = 0, e22:Float = 0, e32:Float = 0,
            e03:Float = 0, e13:Float = 0, e23:Float = 0, e33:Float = 0) {
        this.e00 = e00;
        this.e10 = e10;
        this.e20 = e20;
        this.e30 = e30;
        this.e01 = e01;
        this.e11 = e11;
        this.e21 = e21;
        this.e31 = e31;
        this.e02 = e02;
        this.e12 = e12;
        this.e22 = e22;
        this.e32 = e32;
        this.e03 = e03;
        this.e13 = e13;
        this.e23 = e23;
        this.e33 = e33;
    }

    public inline static function identity():Mat4 {
        return new Mat4(
            1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1
        );
    }

    public inline function addMatrix(mat:Mat4):Mat4 {
        e00 += mat.e00;
        e10 += mat.e10;
        e20 += mat.e20;
        e30 += mat.e30;
        e10 += mat.e10;
        e11 += mat.e11;
        e12 += mat.e12;
        e13 += mat.e13;
        e20 += mat.e20;
        e21 += mat.e21;
        e22 += mat.e22;
        e23 += mat.e23;
        e30 += mat.e30;
        e31 += mat.e31;
        e32 += mat.e32;
        e33 += mat.e33;
        return this;
    }

    public inline function subtractMatrix(mat:Mat4):Mat4 {
        e00 -= mat.e00;
        e10 -= mat.e10;
        e20 -= mat.e20;
        e30 -= mat.e30;
        e10 -= mat.e10;
        e11 -= mat.e11;
        e12 -= mat.e12;
        e13 -= mat.e13;
        e20 -= mat.e20;
        e21 -= mat.e21;
        e22 -= mat.e22;
        e23 -= mat.e23;
        e30 -= mat.e30;
        e31 -= mat.e31;
        e32 -= mat.e32;
        e33 -= mat.e33;
        return this;
    }

    public inline function multiplyScalar(scalar:Float):Mat4 {
        e00 *= scalar;
        e10 *= scalar;
        e20 *= scalar;
        e30 *= scalar;
        e10 *= scalar;
        e11 *= scalar;
        e12 *= scalar;
        e13 *= scalar;
        e20 *= scalar;
        e21 *= scalar;
        e22 *= scalar;
        e23 *= scalar;
        e30 *= scalar;
        e31 *= scalar;
        e32 *= scalar;
        e33 *= scalar;
        return this;
    }

    public inline function determinant():Float {
		// TODO
        return 0;
    }

    public inline function toArray():Array<Float> {
        return [e00, e01, e02, e03, e10, e11, e12, e13, e20, e21, e22, e23, e30, e31, e32, e33];
    }
}