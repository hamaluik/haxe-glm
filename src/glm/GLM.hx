package glm;

class GLM {
    public inline static function lerp(a:Float, b:Float, t:Float):Float {
        return a + t * (b - a);
    }

    public inline static function translation(position:Vec3):Mat4 {
        return new Mat4(
            1, 0, 0, position.x,
            0, 1, 0, position.y,
            0, 0, 1, position.z,
            0, 0, 0, 1
        );
    }

    public inline static function scale(scale:Vec3):Mat4 {
        return new Mat4(
            scale.x, 0, 0, 0,
            0, scale.y, 0, 0,
            0, 0, scale.z, 0,
            0, 0, 0, 1
        );
    }
}