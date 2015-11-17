package glm;

abstract Mat4(Array<Float>) {
	public function new(?elements:Array<Float>) {
		if(elements == null) {
			var arr:Array<Float> = new Array<Float>();
			for(i in 0...16) {
				arr.push(0);
			}
			this = arr;
		}
		else {
			fromArray(elements);
		}
	}

	inline public function fromArray(elements:Array<Float>):Mat4 {
		if(elements.length != 16) {
			throw "Mat4 must be constructed with either no elements, or exactly 16!";
		}
		this = elements;
		return cast this;
	}
}