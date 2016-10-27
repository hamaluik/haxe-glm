import haxe.macro.Context;

using StringTools;

// stolen from haxe/doc/ImportAll.hx
class ImportAll {
	private static var skippedFiles:Array<String> = [
		".svn", "_std", "src"
	];
	private static var skippedDirectories:Array<String> = [
	];

	public static function run( ?pack ) {
		if( pack == null ) {
			pack = "";
			haxe.macro.Compiler.define("doc_gen");
		}
		if (Context.defined("interp")) {
			haxe.macro.Compiler.define("macro");
		}
		switch( pack ) {
		case "php":
			if( !Context.defined("php") ) return;
		case "neko":
			if( !Context.defined("neko") ) return;
		case "js":
			if( !Context.defined("js") ) return;
		case "hl":
			if( !Context.defined("hl") ) return;
		case "lua":
			if( !Context.defined("lua") ) return;
		case "cpp":
			if( !Context.defined("cpp") ) return;
		case "flash8":
			return; // TODO: remove this when flash8 is removed from std library
		case "flash":
			if( !Context.defined("flash9") ) return;
		case "mt","mtwin":
			return;
		case "sys":
			if( !Context.defined("neko") && !Context.defined("php") && !Context.defined("cpp") ) return;
		case "java":
			if( !Context.defined("java") ) return;
		case "cs":
			if( !Context.defined("cs") ) return;
		case "python":
			if( !Context.defined("python") ) return;
		case "tools", "build-tool": return;
		}
		for( p in Context.getClassPath() ) {
			if( p == "/" )
				continue;
			// skip if we have a classpath to haxe
			if( pack.length == 0 && sys.FileSystem.exists(p+"std") )
				continue;
			var p = p + pack.split(".").join("/");
			if( StringTools.endsWith(p,"/") )
				p = p.substr(0,-1);
			if( !sys.FileSystem.exists(p) || !sys.FileSystem.isDirectory(p) )
				continue;
			if(skippedDirectories.indexOf(p) != -1)
				continue;
			for( file in sys.FileSystem.readDirectory(p) ) {
				if(skippedFiles.indexOf(file) != -1)
					continue;
				var full = (pack == "") ? file : pack + "." + file;
				if( StringTools.endsWith(file, ".hx") ) {
					var cl = full.substr(0, full.length - 3);
					if(cl.startsWith("lib.utest")) continue;
					if(cl.startsWith("utest")) continue;
					if(cl.startsWith("promhx.mdo")) continue;
					if(cl.startsWith("promhx.haxe")) continue;
					if(cl.startsWith("js.promhx")) continue;
					if(cl.startsWith("sample.")) continue;
					switch( cl ) {
					case "ImportAll", "neko.db.MacroManager": continue;
					case "haxe.TimerQueue": if( Context.defined("neko") || Context.defined("php") || Context.defined("cpp") ) continue;
					case "Sys": if( !(Context.defined("neko") || Context.defined("php") || Context.defined("cpp")) ) continue;
					case "haxe.web.Request": if( !(Context.defined("neko") || Context.defined("php") || Context.defined("js")) ) continue;
					case "haxe.macro.ExampleJSGenerator","haxe.macro.Context", "haxe.macro.Compiler": if( !Context.defined("neko") ) continue;
					case "haxe.remoting.SocketWrapper": if( !Context.defined("flash") ) continue;
					case "haxe.remoting.SyncSocketConnection": if( !(Context.defined("neko") || Context.defined("php") || Context.defined("cpp")) ) continue;
					case "neko.vm.Ui" | "sys.db.Sqlite" | "sys.db.Mysql": if ( Context.defined("interp") ) continue;
					case "sys.db.Sqlite" | "sys.db.Mysql" | "cs.db.AdoNet": if ( Context.defined("cs") ) continue;
					case "haxe.PythonSyntax" | "haxe.PythonInternal": continue; // temp hack (https://github.com/HaxeFoundation/haxe/issues/3321)
					}
					//trace( "loading module: " + cl);
					try {
						Context.getModule(cl);
					}
					catch(exc:Dynamic) {
						trace("Couldn't get module: " + cl);
						//throw(exc);
					}
				} else if( sys.FileSystem.isDirectory(p + "/" + file) )
					run(full);
			}
		}
	}

}