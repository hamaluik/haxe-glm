(function (console) { "use strict";
var Sample = function() { };
Sample.main = function() {
	console.log("I am a sample!");
};
Sample.main();
})(typeof console != "undefined" ? console : {log:function(){}});
