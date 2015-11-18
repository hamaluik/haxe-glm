package glm;

class GLM {
	public static function frustum(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float):Mat4 {
		var result:Mat4 = new Mat4();
		result.identity();

		// todo

		return result;
	}

	public static function ortho(left:Float, right:Float, bottom:Float, top:Float, near:Float=-1, far:Float=1):Mat4 {
		var result:Mat4 = new Mat4();
		result.identity();

		// todo

		return result;
	}
}