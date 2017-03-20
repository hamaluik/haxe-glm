package glm;

class Mat4 {
    // element access is column-major
    public var r0c0:Float; public var r1c0:Float; public var r2c0:Float; public var r3c0:Float;
    public var r0c1:Float; public var r1c1:Float; public var r2c1:Float; public var r3c1:Float;
    public var r0c2:Float; public var r1c2:Float; public var r2c2:Float; public var r3c2:Float;
    public var r0c3:Float; public var r1c3:Float; public var r2c3:Float; public var r3c3:Float;

    public inline function new(
            r0c0:Float = 0, r1c0:Float = 0, r2c0:Float = 0, r3c0:Float = 0,
            r0c1:Float = 0, r1c1:Float = 0, r2c1:Float = 0, r3c1:Float = 0,
            r0c2:Float = 0, r1c2:Float = 0, r2c2:Float = 0, r3c2:Float = 0,
            r0c3:Float = 0, r1c3:Float = 0, r2c3:Float = 0, r3c3:Float = 0) {
        this.r0c0 = r0c0;
        this.r1c0 = r1c0;
        this.r2c0 = r2c0;
        this.r3c0 = r3c0;
        this.r0c1 = r0c1;
        this.r1c1 = r1c1;
        this.r2c1 = r2c1;
        this.r3c1 = r3c1;
        this.r0c2 = r0c2;
        this.r1c2 = r1c2;
        this.r2c2 = r2c2;
        this.r3c2 = r3c2;
        this.r0c3 = r0c3;
        this.r1c3 = r1c3;
        this.r2c3 = r2c3;
        this.r3c3 = r3c3;
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
        r0c0 += mat.r0c0;
        r1c0 += mat.r1c0;
        r2c0 += mat.r2c0;
        r3c0 += mat.r3c0;
        r1c0 += mat.r1c0;
        r1c1 += mat.r1c1;
        r1c2 += mat.r1c2;
        r1c3 += mat.r1c3;
        r2c0 += mat.r2c0;
        r2c1 += mat.r2c1;
        r2c2 += mat.r2c2;
        r2c3 += mat.r2c3;
        r3c0 += mat.r3c0;
        r3c1 += mat.r3c1;
        r3c2 += mat.r3c2;
        r3c3 += mat.r3c3;
        return this;
    }

    public inline function subtractMatrix(mat:Mat4):Mat4 {
        r0c0 -= mat.r0c0;
        r1c0 -= mat.r1c0;
        r2c0 -= mat.r2c0;
        r3c0 -= mat.r3c0;
        r1c0 -= mat.r1c0;
        r1c1 -= mat.r1c1;
        r1c2 -= mat.r1c2;
        r1c3 -= mat.r1c3;
        r2c0 -= mat.r2c0;
        r2c1 -= mat.r2c1;
        r2c2 -= mat.r2c2;
        r2c3 -= mat.r2c3;
        r3c0 -= mat.r3c0;
        r3c1 -= mat.r3c1;
        r3c2 -= mat.r3c2;
        r3c3 -= mat.r3c3;
        return this;
    }

    public inline function multiplyScalar(scalar:Float):Mat4 {
        r0c0 *= scalar;
        r1c0 *= scalar;
        r2c0 *= scalar;
        r3c0 *= scalar;
        r1c0 *= scalar;
        r1c1 *= scalar;
        r1c2 *= scalar;
        r1c3 *= scalar;
        r2c0 *= scalar;
        r2c1 *= scalar;
        r2c2 *= scalar;
        r2c3 *= scalar;
        r3c0 *= scalar;
        r3c1 *= scalar;
        r3c2 *= scalar;
        r3c3 *= scalar;
        return this;
    }

    public inline function determinant():Float {
		return r0c0*r1c1*r2c2*r3c3 - r0c0*r1c1*r2c3*r3c2 - r0c0*r1c2*r2c1*r3c3 + r0c0*r1c2*r2c3*r3c1 + r0c0*r1c3*r2c1*r3c2 - r0c0*r1c3*r2c2*r3c1 - r0c1*r1c0*r2c2*r3c3 + r0c1*r1c0*r2c3*r3c2 + r0c1*r1c2*r2c0*r3c3 - r0c1*r1c2*r2c3*r3c0 - r0c1*r1c3*r2c0*r3c2 + r0c1*r1c3*r2c2*r3c0 + r0c2*r1c0*r2c1*r3c3 - r0c2*r1c0*r2c3*r3c1 - r0c2*r1c1*r2c0*r3c3 + r0c2*r1c1*r2c3*r3c0 + r0c2*r1c3*r2c0*r3c1 - r0c2*r1c3*r2c1*r3c0 - r0c3*r1c0*r2c1*r3c2 + r0c3*r1c0*r2c2*r3c1 + r0c3*r1c1*r2c0*r3c2 - r0c3*r1c1*r2c2*r3c0 - r0c3*r1c2*r2c0*r3c1 + r0c3*r1c2*r2c1*r3c0;
    }

    public inline function toArray():Array<Float> {
        return [r0c0, r0c1, r0c2, r0c3, r1c0, r1c1, r1c2, r1c3, r2c0, r2c1, r2c2, r2c3, r3c0, r3c1, r3c2, r3c3];
    }
}