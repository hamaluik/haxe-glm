package ;

import glm.*;

class TestMain {
	public static function main() {
		var reporter = new buddy.reporting.ConsoleFileReporter(true);
		var runner = new buddy.SuitesRunner([
			new TestGLM(),
			new TestMat3(),
			new TestMat4(),
			new TestVec3(),
			new TestVec4(),
			new TestQuat()
		], reporter);

		runner.run();
	}
}
