var http = require('http');
var cube = require('../');
var charm = require('charm');

http.createServer(function (req, res) {
    cube({ charm : charm(req, res) });
}).listen(8083);

console.log('listening on :8083');
