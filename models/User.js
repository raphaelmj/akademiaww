const db = require('../config/db-orm');

var User = db.define("user", {
    login     : String,
    password  : String,
    status    : Number,
    updated_at: Date
});

module.exports = User;