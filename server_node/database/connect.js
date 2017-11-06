const mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'truckapp'
});
connection.connect((err) => {
    if(err) throw err;
    console.log("Connected database");
});
module.exports = connection;