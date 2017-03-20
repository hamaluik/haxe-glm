package glm;

class Mat4Tools {
    /**
     *  Multiplies two matrices
     *  @param a - The left-hand side matrix
     *  @param b - The right-hand side matrix
     *  @return Mat4
     */
    public inline static function multiplyMatrix(a:Mat4, b:Mat4):Mat4 {
        return new Mat4(
            // column 1..
            a.r0c0*b.r0c0 + a.r0c1*b.r1c0 + a.r0c2*b.r2c0 + a.r0c3*b.r3c0,
            a.r1c0*b.r0c0 + a.r1c1*b.r1c0 + a.r1c2*b.r2c0 + a.r1c3*b.r3c0,
            a.r2c0*b.r0c0 + a.r2c1*b.r1c0 + a.r2c2*b.r2c0 + a.r2c3*b.r3c0,
            a.r3c0*b.r0c0 + a.r3c1*b.r1c0 + a.r3c2*b.r2c0 + a.r3c3*b.r3c0,
            // column 2..
            a.r0c0*b.r0c1 + a.r0c1*b.r1c1 + a.r0c2*b.r2c1 + a.r0c3*b.r3c1,
            a.r1c0*b.r0c1 + a.r1c1*b.r1c1 + a.r1c2*b.r2c1 + a.r1c3*b.r3c1,
            a.r2c0*b.r0c1 + a.r2c1*b.r1c1 + a.r2c2*b.r2c1 + a.r2c3*b.r3c1,
            a.r3c0*b.r0c1 + a.r3c1*b.r1c1 + a.r3c2*b.r2c1 + a.r3c3*b.r3c1,
            // column 3..
            a.r0c0*b.r0c2 + a.r0c1*b.r1c2 + a.r0c2*b.r2c2 + a.r0c3*b.r3c2,
            a.r1c0*b.r0c2 + a.r1c1*b.r1c2 + a.r1c2*b.r2c2 + a.r1c3*b.r3c2,
            a.r2c0*b.r0c2 + a.r2c1*b.r1c2 + a.r2c2*b.r2c2 + a.r2c3*b.r3c2,
            a.r3c0*b.r0c2 + a.r3c1*b.r1c2 + a.r3c2*b.r2c2 + a.r3c3*b.r3c2,
            // column 4..
            a.r0c0*b.r0c3 + a.r0c1*b.r1c3 + a.r0c2*b.r2c3 + a.r0c3*b.r3c3,
            a.r1c0*b.r0c3 + a.r1c1*b.r1c3 + a.r1c2*b.r2c3 + a.r1c3*b.r3c3,
            a.r2c0*b.r0c3 + a.r2c1*b.r1c3 + a.r2c2*b.r2c3 + a.r2c3*b.r3c3,
            a.r3c0*b.r0c3 + a.r3c1*b.r1c3 + a.r3c2*b.r2c3 + a.r3c3*b.r3c3);
    }

    /**
     *  Calculates m * v, as a new matrix
     *  @param m - the matrix to multiply `v` by
     *  @param v - the vector to be multiplied
     *  @return Vec4
     */
    public inline static function multiplyVector(m:Mat4, v:Vec4):Vec4 {
        // TODO
        return v;
    }

    /**
     *  Transposes
     *  @param m - the matrix to be transposed
     *  @return Mat4
     */
    public inline static function transpose(m:Mat4):Mat4 {
        return new Mat4(
            m.r0c0, m.r0c1, m.r0c2, m.r0c3,
            m.r1c0, m.r1c1, m.r1c2, m.r1c3,
            m.r2c0, m.r2c1, m.r2c2, m.r2c3,
            m.r3c0, m.r3c1, m.r3c2, m.r3c3
        );
    }

    /**
     *  Inverts a matrix
     *  @param m - the matrix to invert
     *  @return Mat4
     */
    public inline static function invert(m:Mat4):Mat4 {
        var det:Float = m.determinant();
        if(Math.abs(det) <= 0.00001) {
            throw 'Can\'t invert matrix, determinant too small!';
        }

        var inverse:Mat4 = new Mat4();

        return inverse;
    }
}