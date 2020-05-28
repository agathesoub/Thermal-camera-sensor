var http = require('http'), fs = require('fs');
var server = http.createServer(function(request,response)
{
	var stream = fs.createReadStream('processing/data.txt'); //Create strem
	stream.on('error', function(err) //Handle errors
	{
		response.statusCode=500;
		response.end(String(err));
	});
	
	stream.pipe(response); //pipe response to client 
});

server.listen(8000);
console.log('listening on port 8000');



