package glm;

class Transform {
    /**
     *  Builds a translation matrix given the `x`, `y`, and `z` translations
     *  @param x - 
     *  @param y - 
     *  @param z - 
     *  @return Mat4
     */
    public inline function translation(x:Float, y:Float, z:Float):Mat4 {
        return new Mat4(
            1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            x, y, z, 1
        );
    }
}