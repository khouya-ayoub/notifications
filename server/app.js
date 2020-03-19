const express = require('express');
const bodyParser = require('body-parser');
const db_funct = require('./data_base/functions');

// init app
const app = express();

// General MidelWare
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
});

// transform
app.use(bodyParser.json());

// Request for authentication to the system
app.get('/auth/:login/:password',(request, response, next) => {
    db_funct.login(request, response);
});

// export the app
module.exports = app;
