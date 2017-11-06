const bodyParser = require("body-parser");
module.exports = function(express) {
    var app = express();
    app.set('view engine', 'ejs');
    app.set('views','/views');
    app.use(express.static('public'));
    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({ extended: false }));    
}