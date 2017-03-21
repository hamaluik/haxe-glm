package glm;

#if js
typedef FloatArray = js.html.Float32Array;
#else
typedef FloatArray = haxe.io.Float32Array;
#end

class GLM {
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
}