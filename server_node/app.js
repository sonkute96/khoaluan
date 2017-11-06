/* Truck application for final project. Through app, client can call neccessary services for example delivery product.
The main language or technology: NodeJS.
The main database language: MySQL with XAMPP server.
The main protocol: HTTP.
UDP protocol is used to track location of devices.
*/
const dgram = require('dgram');
const PORT = process.env.UDPPORT || 33333;
const HOST = "localhost";
const express = require('express');
const app = express();
const connection = require('./database/connect');
const driver = require('./service/driverService');
const server = dgram.createSocket('udp4'); // the former uses IPv4.
const http = require('http').Server(app);
const io = require('socket.io')(http);
app.get('/', (req,res) => {
    res.send("hello world");
});
io.on('connection', function(socket){
    console.log('a user connected : ' +socket.id); 
    socket.on("client-send-username", function(data) {
        var sql = "Select * from driver as dr where dr.fname=" +"\""+data+"\"";
        connection.query(sql, (err,result,fields) => {
            if (err) throw err;
            if(result == "") {
                socket.emit("server-send-alertUsernameError", "Username khong hop le!");
            } else {
                console.log(result[0]);
                socket.on("client-send-password", function(data) {
                    // compare password with result object.
                    console.log(data);
                });
            }
        });
    });
});
http.listen(3000, function() {
    console.log("App connected with port 3000");
});
/* Config static file and view engine */
require('./config')(express);
/* Build UDP protocol to tracking location of deivces */
server.on("listening",() => {
    console.log("UDP listens port " + server.address().port);
});
server.on('message', (message, remote) => {
    console.log(remote.address + ':' + remote.port + ' - ' + message);  
});
server.on('error', (err) => {
    console.log("server error : \n${err.stack}");
    server.close();
});
server.bind(PORT, HOST);
app.use('/user',driver);