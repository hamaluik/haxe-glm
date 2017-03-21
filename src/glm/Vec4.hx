package glm;

import glm.GLM.FloatArray;

class Vec4 {
	/**
	 *  The data stored in the vector
	 */
	public var e:FloatArray;

    /**
     *  Accessor utility for the first element of the vector
     */
    public var x(get, set):Float;
    private function get_x():Float {
        return e[0];
    }
    private function set_x(v:Float):Float {
        return e[0] = v;
    }

    /**
     *  Accessor utility for the second element of the vector
     */
    public var y(get, set):Float;
    private function get_y():Float {
        return e[1];
    }
    private function set_y(v:Float):Float {
        return e[1] = v;
    }

    /**
     *  Accessor utility for the third element of the vector
     */
    public var z(get, set):Float;
    private function get_z():Float {
        return e[2];
    }
    private function set_z(v:Float):Float {
        return e[2] = v;
    }

    /**
     *  Accessor utility for the fourth element of the vector
     */
    public var w(get, set):Float;
    private function get_w():Float {
        return e[3];
    }
    private function set_w(v:Float):Float {
        return e[3] = v;
    }

    public function new(x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 0) {
        e = new FloatArray(4);
        e[0] = x;
        e[1] = y;
        e[2] = z;
        e[3] = w;
    }

	/**
	 *  Checks if `this == v` on an element-by-element basis
	 *  @param v - The vector to check against
	 *  @return Bool
	 */
	public function equals(v:Vec4):Bool {
		for(i in 0...4) {
			if(Math.abs(e[i] - v.e[i]) >= 0.000000001) {
				return false;
			}
		}
		return true;
	}

	/**
	 *  Creates a string reprentation of `this`
	 *  @return String
	 */
	public function toString():String {
		return
			'<${e[0]}, ${e[1]}, ${e[2]}, ${e[3]}>';
	}
}