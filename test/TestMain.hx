package ;

import glm.*;

class TestMain {
	public static function main() {
		#if coverage
		TestMain.initCoverage();
		#end

		var reporter = new buddy.reporting.ConsoleReporter();
		var runner = new buddy.SuitesRunner([
			new TestVec2(),
			new TestVec3(),
			new TestVec4(),
			new TestMat4(),
			new TestGLM()
		], reporter);

		runner.run();

		#if coverage
		// calculate the coverage
		var coverage:Float = Coverage.calculatePercent();
		var severity:String = 
			if(coverage == 100) 'brightgreen';
			else if(coverage >= 75) 'green';
			else if(coverage >= 50) 'yellow';
			else if(coverage >= 25) 'orange';
			else 'red';

		// report!
		Sys.println('Testing coverage: ${coverage}%');

		// report the details as JSON!
		var json:String = Coverage.toJson();
		sys.io.File.saveContent('coverage.json', json);
		Sys.println('Details saved in \'coverage.json\'');

		// update the README
		var readme:String = sys.io.File.getContent('README.md');
		var r:EReg = ~/https:\/\/img\.shields\.io\/badge\/coverage-([0-9]+)%25-([a-z]+)\.svg/g;
		readme = r.replace(readme, 'https://img.shields.io/badge/coverage-${coverage}%25-${severity}.svg');
		sys.io.File.saveContent('README.md', readme);
		#end
	}
}