const express = require('express');
const app = express();
const port = 3000;

var mysql = require('mysql');

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'myappuser',
  password: '#Mypass456',
  database: 'upskill_2021_blog',
  port: 3306
});

connection.connect();

app.get("/", (req, res) => {
  var query = connection.query(
    'SELECT * FROM users', function(err, result, fields) {
      if (err) throw err;
      console.log('result: ', result);
      res.setHeader('Access-Control-Allow-Origin', '*');
      res.send(result);
    });
});
var nu, np, nc;
app.get("/info", (req,res) => {
    var resposta;
    connection.query(
        'SELECT COUNT(*) AS conta from users', (err, result, fields) => {
            if (err) throw err;
            nu = result[0]['conta'];
    });
    connection.query(
        'SELECT COUNT(*) AS conta from posts', (err, result, fields) => {
            if (err) throw err;
            np = result[0]['conta'];
    });
    connection.query(
        'SELECT COUNT(*) AS conta from comments', (err, result, fields) => {
            if (err) throw err;
            nc = result[0]['conta'];
    });
    resposta = `{"users": ${nu}, "posts": ${np}, "comments": ${nc}}`;
    // res.setHeader('Access-Control-Allow-Origin', '*');
    res.status(200).send(resposta)
});
app.get("/users/:id/posts", (req,res) => {
    connection.query(
        `SELECT b.title, a.name from users a, posts b 
            where a.id="${req.params.id}" and a.id=b.user_id`, (err, result, fields) => {
            if(err) throw err;
            res.send(result);
    });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

//connection.end();
