function mylogger(message)
{
	// send an HTTP request
	console.log(message);
}

function mylogger2(message)
{
	// send an HTTP request
	console.log(message + " xxx");
}
module.exports = { mylogger, mylogger2 };
