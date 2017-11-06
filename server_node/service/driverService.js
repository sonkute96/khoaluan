/* Driver apis */
const connection = require('../database/connect');
const express = require('express');
var routeDriver = express.Router();
routeDriver.get('/drivers', (req,res) => {
    var sql = "Select * from driver as dr order by dr.driver_id";
    connection.query(sql, (err,result,fields) => {
        if (err) throw err;
        res.send(result);
    });
});
module.exports = routeDriver;