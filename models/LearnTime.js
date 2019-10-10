const db = require('../config/db-orm');

var LearnTime = db.define("learn_time", {
    name: Number,
    sign: String,
    description: String,
    start_time:Date,
    end_time:Date
});


module.exports = LearnTime;