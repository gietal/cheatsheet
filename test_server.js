const http = require('http');

const requestListener = function (req, res) {
// 	res.removeHeader('transfer-encoding'); // force http 1.0
	res.httpVersionMinor = 0;
	res.writeHead(302, {
		'Connection': 'Keep-Alive',
		'Content-Length': '0',
		'Location': '/rdweb/feedlogin/webfeedlogin.aspx',
		'Server': 'BigIP'
	});
		res.httpVersionMinor = 0;
	res.end();
}

const server = http.createServer(requestListener);
const port = 9393;
console.log("listening on port %d", port);
server.listen(port);
