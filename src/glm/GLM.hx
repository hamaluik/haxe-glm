package glm;

#if js
typedef FloatArray = js.html.Float32Array;
#else
typedef FloatArray = haxe.io.Float32Array;
#end

class GLM {
    public inline static function lerp(a:Float, b:Float, t:Float):Float {
        return a + t * (b - a);
    }
}