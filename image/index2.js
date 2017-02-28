var express = require('express')
var app = express()

app.get('/', function (req, res) {
  res.send('Hello World from index2.js');
  console.log("index2.js Responding to / route");
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
})
