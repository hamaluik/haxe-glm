package glm;

import glm.GLM.FloatArray;

class Mat4 {
    /**
     *  The actual data stored in the matrix
     *  Note that it is stored according to WebGL standards
     *  i.e. the translation components of a matrix using
     *  these elements occupy the 13th, 14th, and 15th elements
     */
    public var e:FloatArray;

    public function new(
            r0c0:Float = 0, r1c0:Float = 0, r2c0:Float = 0, r3c0:Float = 0,
            r0c1:Float = 0, r1c1:Float = 0, r2c1:Float = 0, r3c1:Float = 0,
            r0c2:Float = 0, r1c2:Float = 0, r2c2:Float = 0, r3c2:Float = 0,
            r0c3:Float = 0, r1c3:Float = 0, r2c3:Float = 0, r3c3:Float = 0) {
        this.e = new FloatArray(16);
        e[0] = r0c0;
        e[1] = r1c0;
        e[2] = r2c0;
        e[3] = r3c0;

        e[4] = r0c1;
        e[5] = r1c1;
        e[6] = r2c1;
        e[7] = r3c1;

        e[8] = r0c2;
        e[9] = r1c2;
        e[10] = r2c2;
        e[11] = r3c2;

        e[12] = r0c3;
        e[13] = r1c3;
        e[14] = r2c3;
        e[16] = r3c3;
    }

    public function equals(m:Mat4):Bool {
        for(i in 0...16) {
            if(Math.abs(e[i] - m.e[i]) >= 0.000000001) {
                return false;
            }
        }
        return true;
    }

    public static function identity():Mat4 {
        var m:Mat4 = new Mat4();
        m.e[0] = 1;
        m.e[1] = 0;
        m.e[2] = 0;
        m.e[3] = 0;
        m.e[4] = 0;
        m.e[5] = 1;
        m.e[6] = 0;
        m.e[7] = 0;
        m.e[8] = 0;
        m.e[9] = 0;
        m.e[10] = 1;
        m.e[11] = 0;
        m.e[12] = 0;
        m.e[13] = 0;
        m.e[14] = 0;
        m.e[15] = 1;
        return m;
    }

    public static function clone(m:Mat4):Mat4 {
        var nm:Mat4 = new Mat4();
        nm.e[0] = m.e[0];
        nm.e[1] = m.e[1];
        nm.e[2] = m.e[2];
        nm.e[3] = m.e[3];
        nm.e[4] = m.e[4];
        nm.e[5] = m.e[5];
        nm.e[6] = m.e[6];
        nm.e[7] = m.e[7];
        nm.e[8] = m.e[8];
        nm.e[9] = m.e[9];
        nm.e[10] = m.e[10];
        nm.e[11] = m.e[11];
        nm.e[12] = m.e[12];
        nm.e[13] = m.e[13];
        nm.e[14] = m.e[14];
        nm.e[15] = m.e[15];
        return nm;
    }

    public static function copy(src:Mat4, dest:Mat4):Mat4 {
        dest.e[0] = src.e[0];
        dest.e[1] = src.e[1];
        dest.e[2] = src.e[2];
        dest.e[3] = src.e[3];
        dest.e[4] = src.e[4];
        dest.e[5] = src.e[5];
        dest.e[6] = src.e[6];
        dest.e[7] = src.e[7];
        dest.e[8] = src.e[8];
        dest.e[9] = src.e[9];
        dest.e[10] = src.e[10];
        dest.e[11] = src.e[11];
        dest.e[12] = src.e[12];
        dest.e[13] = src.e[13];
        dest.e[14] = src.e[14];
        dest.e[15] = src.e[15];
        return dest;
    }


}