var page = require('webpage').create();
var system = require('system');

if (system.args.length === 2) {
    console.log('Usage: picture.js <URL> <FileName>');
    phantom.exit();
}

var address = system.args[1];
var file_name = system.args[2];

page.viewportSize = { width: 2880, height: 1800 };

page.open(address, function(status) {
    page.render(file_name);

    phantom.exit();
});