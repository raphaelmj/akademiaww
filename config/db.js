var mysql = require('mysql');
var util = require('util')

var mysqlConnection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'web'
});

var pool  = mysql.createPool({
  connectionLimit : 10,
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'web'
});

pool.query = util.promisify(pool.query)

module.exports = {connect: mysqlConnection, poolConnect:pool};