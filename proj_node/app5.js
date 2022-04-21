const express = require('express');
const app = express();

app.get('/', (req, res) => {
	res.send('GET request to the homepage');
});

app.get('/topic', (req, res) => {
	res.send([1, 2, 3]);
});

app.post('/', (req, res) => {
	res.send('POST request to the homepage');
});

app.listen(8081, () => console.log('listen on port 8081'));
