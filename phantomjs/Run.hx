import Sys.*;
import sys.FileSystem.*;
import sys.io.File.*;
import haxe.*;
import haxe.io.*;
using StringTools;

/**
    Test a JS file in PhantomJS.
*/
class Run {
    static var phantomjsRunner(default, never) = "phantomjs/phantomjs.js";
    static var phantomjsHtml(default, never) = "phantomjs/phantomjs.html";
    static function main() {
        var args = args();
        var jsFile = fullPath(args[0]);

        var tmpl = new Template(getContent(phantomjsHtml));
        var html = tmpl.execute({
        	jsFile: Path.withoutDirectory(jsFile)
        });
        saveContent(Path.join([Path.directory(jsFile), "phantomjs.html"]), html);

        var exitCode = command("phantomjs", [phantomjsRunner]);
        exit(exitCode);
    }
}