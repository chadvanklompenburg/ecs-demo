var express = require('express')
var app = express()

app.get('/', function (req, res) {
  res.send('Hello World from index.js');
  console.log("index.js Responding to / route");
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
})
