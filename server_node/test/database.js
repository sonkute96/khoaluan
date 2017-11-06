const mysql = require('mysql');
describe("testConnectDB", () => {
    it("Connected database", (done) => {
        var connection = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'truckapp'
        });
        connection.connect((err) => {
            if(err) done(err);
            else done();
        });
    });
});