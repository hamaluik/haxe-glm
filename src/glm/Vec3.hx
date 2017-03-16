package glm;

class Vec3 {
    public var x:Float;
    public var y:Float;
    public var z:Float;

    public inline function get(index:Int):Float {
        return switch(index) {
            case 0: x;
            case 1: y;
            case 2: z;
            case _: null;
        };
    }

    public inline function set(index:Int, value:Float):Float {
        return switch(index) {
            case 0: x = value;
            case 1: y = value;
            case 2: z = value;
            case _: null;
        };
    }

    public var sqrLength(get, never):Float;
    private function get_sqrLength():Float {
        return x*x + y*y + z*z;
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
        return length;
    }

    public function new(x:Float = 0, y:Float = 0, z:Float = 0) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public inline function addVec3(vec:Vec3):Vec3 {
        this.x += vec.x;
        this.y += vec.y;
        this.z += vec.z;
        return this;
    }

    public inline function addScalar(value:Float):Vec3 {
        this.x += value;
        this.y += value;
        this.z += value;
        return this;
    }

    public inline function subtractVec3(vec:Vec3):Vec3 {
        this.x -= vec.x;
        this.y -= vec.y;
        this.z -= vec.z;
        return this;
    }

    public inline function subtractScalar(value:Float):Vec3 {
        this.x -= value;
        this.y -= value;
        this.z -= value;
        return this;
    }

    public inline static function multiplyComponents(a:Vec3, b:Vec3) {
        return new Vec3(a.x * b.x, a.y * b.y, a.z * b.z);
    }

    public inline function multiplyScalar(scale:Float):Vec3 {
        this.x *= scale;
        this.y *= scale;
        this.z *= scale;
        return this;
    }

    public inline function normalize():Vec3 {
        length = 1;
        return this;
    }

    public inline function toArray():Array<Float> {
        return [x, y, z];
    }

    public static function fromArray(array:Array<Float>):Vec3 {
        var v:Vec3 = new Vec3();
        if(array.length > 0) v.x = array[0];
        if(array.length > 1) v.y = array[1];
        if(array.length > 2) v.z = array[2];
        return v;
    }

    public inline function clone():Vec3 {
        return new Vec3(x, y, z);
    }

    public inline function lerp(target:Vec3, t:Float):Vec3 {
        x = GLM.lerp(x, target.x, t);
        y = GLM.lerp(y, target.y, t);
        z = GLM.lerp(z, target.z, t);
        return this;
    }

    public inline static function dot(a:Vec3, b:Vec3):Float {
        return a.x * b.x +
            a.y * b.y +
            a.z * b.z;
    }

    public function toString():String {
        return '[${x}, ${y}, ${z}]';
    }
}