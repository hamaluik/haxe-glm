package glm;

class Vec4 {
    public var x:Float;
    public var y:Float;
    public var z:Float;
    public var w:Float;

    public inline function get(index:Int):Float {
        return switch(index) {
            case 0: x;
            case 1: y;
            case 2: z;
            case 3: w;
            case _: null;
        };
    }

    public inline function set(index:Int, value:Float):Float {
        return switch(index) {
            case 0: x = value;
            case 1: y = value;
            case 2: z = value;
            case 3: w = value;
            case _: null;
        };
    }

    public var sqrLength(get, never):Float;
    private function get_sqrLength():Float {
        return x*x + y*y + z*z + w*w;
    }

    public var length(get, set):Float;
    private function get_length():Float {
        return Math.sqrt(sqrLength);
    }
    private function set_length(newLength:Float):Float {
        var l = this.length;
        if(l == 0) return 0;

        var scale:Float = newLength / l;
        x *= scale;
        y *= scale;
        z *= scale;
        w *= scale;
        return length;
    }

    public function new(x:Float = 0, y:Float = 0, z:Float = 0, w:Float = 0) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    public inline function addVec4(vec:Vec4):Vec4 {
        this.x += vec.x;
        this.y += vec.y;
        this.z += vec.z;
        this.w += vec.w;
        return this;
    }

    public inline function addScalar(value:Float):Vec4 {
        this.x += value;
        this.y += value;
        this.z += value;
        this.w += value;
        return this;
    }

    public inline function subtractVec4(vec:Vec4):Vec4 {
        this.x -= vec.x;
        this.y -= vec.y;
        this.z -= vec.z;
        this.w -= vec.w;
        return this;
    }

    public inline function subtractScalar(value:Float):Vec4 {
        this.x -= value;
        this.y -= value;
        this.z -= value;
        this.w -= value;
        return this;
    }

    public inline static function multiplyComponents(a:Vec4, b:Vec4) {
        return new Vec4(a.x * b.x, a.y * b.y, a.z * b.z, a.w * b.w);
    }

    public inline function multiplyScalar(scale:Float):Vec4 {
        this.x *= scale;
        this.y *= scale;
        this.z *= scale;
        this.w *= scale;
        return this;
    }

    public inline function normalize():Vec4 {
        length = 1;
        return this;
    }

    public inline function toArray():Array<Float> {
        return [x, y, z, w];
    }

    public static function fromArray(array:Array<Float>):Vec4 {
        var v:Vec4 = new Vec4();
        if(array.length > 0) v.x = array[0];
        if(array.length > 1) v.y = array[1];
        if(array.length > 2) v.z = array[2];
        if(array.length > 3) v.w = array[3];
        return v;
    }

    public inline function clone():Vec4 {
        return new Vec4(x, y, z, w);
    }

    public inline function lerp(target:Vec4, t:Float):Vec4 {
        x = GLM.lerp(x, target.x, t);
        y = GLM.lerp(y, target.y, t);
        z = GLM.lerp(z, target.z, t);
        w = GLM.lerp(w, target.w, t);
        return this;
    }

    public inline static function dot(a:Vec4, b:Vec4):Float {
        return a.x * b.x +
            a.y * b.y +
            a.z * b.z +
            a.w * b.w;
    }

    public function toString():String {
        return '[${x}, ${y}, ${z}, ${w}]';
    }
}