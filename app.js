const express = require('express');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const bodyParser = require('body-parser')
const path = require('path');
const cookieParser = require('cookie-parser');
const robots = require('express-robots-txt');
const pug = require('pug');
const app = module.exports = express();
const multer = require('multer');
const domain = require('./config/domain');

// var express_graphql = require('express-graphql');
// var { graphql } = require('graphql');
// var root = require('./graphql').root;
// var schema = require('./graphql').schema;


app.use(cookieParser())

app.use(bodyParser.json({limit: '50mb'})); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

// app.use(function(req, res, next) {
//     res.setHeader("Cache-Control", "max-age=31556926");
//     return next();
// });

app.use(express.static('static',{
    maxage: false,
    etag: false
}))
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug')
app.set('tmpDir', path.join(__dirname, 'tmp'));

app.set('templates', path.join(__dirname, 'templates'));

//app.use(robots({UserAgent: '*', Sitemap: domain+'/sitemap.xml', Allow: '/'}));
app.use(robots(__dirname + '/robots.txt'));

// app.use(function(req,res,next) {
//     if(req.headers["x-forwarded-proto"] == "http") {
//         res.redirect(domain + req.url);
//     } else {
//         return next();
//     }
// });

// Add headers
app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});


var storage = multer.diskStorage({

    destination: function(req, file, cb, res) {

        cb(null, 'static/images/uploads');

    },

    filename: function(req, file, cb, res) {

        var name = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
        cb(null, name);

        return name;
    }
});

var upload = multer({
    storage: storage
});

app.post('/upload', upload.single('file'), function(req, res) {
    res.json({
        "location": '/images/uploads/' + req.file.filename
    });
});

// app.use(function (req, res, next) {
//   res.status(404).send("Sorry can't find that!")
// })

//app.use(function(req, res, next){
//    res.status(404).send('404');
//});



// app.use('/graphql', express_graphql({
//     schema: schema,
//     rootValue: root,
//     graphiql: true
// }));


const apiRoutes = require('./api-routes');
const adminRoutes = require('./admin-routes');
const webRoutes = require('./web-routes');

app.use('/api', apiRoutes);
app.use('/admin', adminRoutes);
app.use('/', webRoutes);



app.listen(3000,()=>{
    console.log('Start app')
});

// app.listen(4000, () => console.log('Express GraphQL Server Now Running On localhost:4000/graphql'));