var page = require('webpage').create();
var args = require('system').args;
var hasError = false;

page.onConsoleMessage = function(msg) {
  console.log(msg);
};

page.onError = function(msg, trace) {
  hasError = true;
  var msgStack = ['ERROR: ' + msg];
  if (trace && trace.length) {
    msgStack.push('TRACE:');
    trace.forEach(function(t) {
      msgStack.push(' -> ' + t.file + ': ' + t.line + (t.function ? ' (in function "' + t.function +'")' : ''));
    });
  }
  console.error(msgStack.join('\n'));
};

page.onResourceError = function(resourceError) {
  hasError = true;
  console.error('Unable to load resource (#' + resourceError.id + 'URL:' + resourceError.url + ')');
  console.error('Error code: ' + resourceError.errorCode + '. Description: ' + resourceError.errorString);
};

page.open('bin/phantomjs.html', function(status) {
  var success = status === 'success' && !hasError;
  phantom.exit(success ? 0 : 1);
});
