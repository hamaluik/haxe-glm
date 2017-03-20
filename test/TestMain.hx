package ;

import glm.*;

class TestMain {
	public static function main() {
		var reporter = new buddy.reporting.ConsoleFileReporter();
		var runner = new buddy.SuitesRunner([
			new TestMat4()
		], reporter);

		runner.run();
	}
}