var assert = require("assert");
const dgram = require("dgram");
var client = dgram.createSocket("udp4");
const PORT = 33333;
const HOST = "localhost";
describe("TestUDPProtocol", () => {
  describe("#sendString()", () => {
    it("String is sent to server UDP", done => {
      var message = new Buffer("100 Pear Avenue");
      client.send(message, 0, message.length, PORT, HOST, (err, bytes) => {
        if (err) done(err);
        else done();
      });
    });
  });
});
