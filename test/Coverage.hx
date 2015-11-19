import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Compiler;
import haxe.ds.StringMap;

class Coverage {
	macro public static function include(mainType:String, types:Array<String>) {
		//trace(types);
		for(type in types) {
			Compiler.addMetadata("@:build(Coverage.index())", type);

			// force import the type so that all indexes are done
			// by the time we get to setupIndex()
			Context.getModule(type);
		}
		Compiler.addMetadata("@:build(Coverage.setupIndex())", mainType);
		return macro null;
	}

	// store the specifiers for later injection
	private static var specifiers:Array<String> = new Array<String>();

	macro public static function index():Array<Field> {
		//trace('Indexing ' + Context.getLocalModule() + '...');

		// loop through all the fields
		var fields:Array<Field> = Context.getBuildFields();
		for(field in fields) {
			// find functions
			switch(field.kind) {
				case FFun(func): {
					// initialize the count
					var specifier:String = Context.getLocalModule() + '.' + field.name;
					specifiers.push(specifier);

					// inject the recording function call
					func.expr = macro {
						Coverage.recordCall($v{specifier});
						${func.expr};
					};
				}

				case _: {}
			}
		}

		return fields;
	}

	macro public static function setupIndex():Array<Field> {
		trace('Setting up index intializer...');

		var fields:Array<Field> = Context.getBuildFields();

		var initExprs:Array<Expr> = new Array<Expr>();
		for(specifier in specifiers) {
			initExprs.push(macro {Coverage.recordCall($v{specifier});});
		}

		var func = {
			ret: null,
			params: [],
			expr: {pos: Context.currentPos(), expr: EBlock(initExprs)},
			args: []
		};
		var initCoverage = {
			pos: Context.currentPos(),
			name: "initCoverage",
			meta: [],
			kind: FFun(func),
			doc: null,
			access: [Access.APublic, Access.AStatic]
		};
		fields.push(initCoverage);
		
		return fields;
	}

	// runtime tools for checking calls
	public static var calls:StringMap<Int> = new StringMap<Int>();
	public static function recordCall(specifier:String) {
		if(!calls.exists(specifier)) calls.set(specifier, 0);
		else calls.set(specifier, calls.get(specifier) + 1);
	}

	public static function calculatePercent():Float {
		var called:Float = 0;
		var total:Float = 0;
		for(funcCalls in calls.iterator()) {
			total += 1;
			if(funcCalls > 0) {
				called += 1;
			}
		}

		return Math.floor(100 * called / total);
	}

	public static function toJson():String {
		// dirty D:
		var coverage:Dynamic = {};

		for(specifier in calls.keys()) {
			var count:Int = calls.get(specifier);
			var parts:Array<String> = specifier.split('.');
			var className:String = parts.slice(0, parts.length - 1).join('.');
			var functionName:String = parts[parts.length - 1];

			// ensure the class exists
			if(!Reflect.hasField(coverage, className)) {
				Reflect.setField(coverage, className, {});
			}

			// set the function
			Reflect.setField(Reflect.field(coverage, className), functionName, count);
		}

		return haxe.Json.stringify(coverage, '\t');
	}
}