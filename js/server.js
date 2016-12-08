'use strict';

var express = require('express');
var config = require('./config.json');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.listen(config.port, function () {});

