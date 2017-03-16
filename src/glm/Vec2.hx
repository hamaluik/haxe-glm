package glm;

class Vec2 {
    public var x:Float;
    public var y:Float;

    public inline function get(index:Int):Float {
        return switch(index) {
            case 0: x;
            case 1: y;
            case _: null;
        };
    }

    public inline function set(index:Int, value:Float):Float {
        return switch(index) {
            case 0: x = value;
            case 1: y = value;
            case _: null;
        };
    }

    public var sqrLength(get, never):Float;
    private function get_sqrLength():Float {
        return x*x + y*y;
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
        return length;
    }

    public function new(x:Float = 0, y:Float = 0) {
        this.x = x;
        this.y = y;
    }

    public inline function addVec2(vec:Vec2):Vec2 {
        this.x += vec.x;
        this.y += vec.y;
        return this;
    }

    public inline function addScalar(value:Float):Vec2 {
        this.x += value;
        this.y += value;
        return this;
    }

    public inline function subtractVec2(vec:Vec2):Vec2 {
        this.x -= vec.x;
        this.y -= vec.y;
        return this;
    }

    public inline function subtractScalar(value:Float):Vec2 {
        this.x -= value;
        this.y -= value;
        return this;
    }

    public inline static function multiplyComponents(a:Vec2, b:Vec2) {
        return new Vec2(a.x * b.x, a.y * b.y);
    }

    public inline function multiplyScalar(scale:Float):Vec2 {
        this.x *= scale;
        this.y *= scale;
        return this;
    }

    public inline function normalize():Vec2 {
        length = 1;
        return this;
    }

    public inline function toArray():Array<Float> {
        return [x, y];
    }

    public static function fromArray(array:Array<Float>):Vec2 {
        var v:Vec2 = new Vec2();
        if(array.length > 0) v.x = array[0];
        if(array.length > 1) v.y = array[1];
        return v;
    }

    public inline function clone():Vec2 {
        return new Vec2(x, y);
    }

    public inline function lerp(target:Vec2, t:Float):Vec2 {
        x = GLM.lerp(x, target.x, t);
        y = GLM.lerp(y, target.y, t);
        return this;
    }

    public inline static function dot(a:Vec2, b:Vec2):Float {
        return a.x * b.x +
            a.y * b.y;
    }

    public function toString():String {
        return '[${x}, ${y}]';
    }
}