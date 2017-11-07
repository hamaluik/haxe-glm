package ;

import glm.*;
import haxe.Timer;

using StringTools;

typedef ProfileResult = {
	var name:String;
	var times:String;
	var totalTime:String;
	var unitTime:String;
}

class ProfileMain {
	private static var results:Array<ProfileResult> = new Array<ProfileResult>();

	private inline static function log10(x:Float):Float {
		return Math.log(x) / Math.log(10);
	}

	private static function toSI(x:Float):String {
		var incPrefixes:Array<String> = ['k', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y'];
		var decPrefixes:Array<String> = ['m', 'u', 'n', 'p', 'f', 'a', 'z', 'y'];

		var degree:Int = Math.floor(log10(Math.abs(x)) / 3);

		var prefix:String = '';
		if(degree != 0) {
			var ds:Float = degree / Math.abs(degree);
			if(ds == 1) {
				if(degree - 1 < incPrefixes.length) {
					prefix = incPrefixes[degree - 1];
				}
				else {
					prefix = incPrefixes[incPrefixes.length - 1];
					degree = incPrefixes.length;
				}
			}
			else if(ds == -1) {
				if(-degree - 1 < decPrefixes.length) {
					prefix = decPrefixes[-degree - 1];
				}
				else {
					prefix = decPrefixes[decPrefixes.length - 1];
					degree = -decPrefixes.length;
				}
			}

			var scaled:Float = x * Math.pow(1000, -degree);
			scaled = Math.fround(scaled * 10) / 10;
			return '${scaled}${prefix}';
		}

		return '${x}';
	}

	private static function measure(name:String, times:Int = 100000, fn:Void->Void):Void {
		var start:Float = Timer.stamp();
		for(i in 0...times) fn();
		var end:Float = Timer.stamp();
		results.push({
			name: name,
			times: '${times}',
			totalTime: '${end - start}s',
			unitTime: toSI((end - start) / times) + 's'
		});
	}

	private static function printResults() {
		results.insert(0, {
			name: 'Test',
			times: 'Times',
			totalTime: 'Total Time',
			unitTime: 'Unit Time'
		});
		results.insert(1, {
			name: '----',
			times: '-----',
			totalTime: '----------',
			unitTime: '---------'
		});

		var nameWidth:Int = 0, timesWidth:Int = 0, totalTimeWidth:Int = 0, unitTimeWidth:Int = 0;
		for(result in results) {
			if(result.name.length > nameWidth) nameWidth = result.name.length;
			if(result.times.length > timesWidth) timesWidth = result.times.length;
			if(result.totalTime.length > totalTimeWidth) totalTimeWidth = result.totalTime.length;
			if(result.unitTime.length > unitTimeWidth) unitTimeWidth = result.unitTime.length;
		}

		for(result in results) {
			var line:String = '| ';
			line += result.name.rpad(' ', nameWidth) + ' | ';
			line += result.times.lpad(' ', timesWidth) + ' | ';
			line += result.totalTime.lpad(' ', totalTimeWidth) + ' | ';
			line += result.unitTime.lpad(' ', unitTimeWidth) + ' |';

			#if sys
			Sys.println(line);
			#elseif js
			untyped __js__("console.log(line)");
			#else
			trace(line);
			#end
		}
	}

	public static function main() {
		measure("mat4 instantiation", function() {
			var ma:Mat4 = new Mat4(
				1, 0, 0, 0,
				0, 1, 0, 0,
				0, 0, 1, 0,
				1, 2, 3, 1
			);
			ma = null;
		});

		var a:Mat4 = new Mat4(
			1, 0, 0, 0,
			0, 1, 0, 0,
			0, 0, 1, 0,
			1, 2, 3, 1
		);
		var b:Mat4 = new Mat4();
		var va:Vec4 = new Vec4(1, 2, 3, 1);
		var vb:Vec4 = new Vec4();

		measure("mat4 transpose", function() {
			Mat4.transpose(a, b);
		});

		measure("mat4 determinant", function() {
			Mat4.determinant(a);
		});

		measure("mat4 invert", function() {
			Mat4.invert(a, b);
		});

		measure("mat4 mat multiply", function() {
			Mat4.multMat(a, b, b);
		});

		measure("mat4 vec multiply", function() {
			Mat4.multVec(a, va, vb);
		});

		printResults();
	}
}
