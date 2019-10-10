const db = require('../config/db-orm');
const Course = require('./Course');
const Link = require('./Link');

var School = db.define("school", {
    name: String,
    alias: String,
    icon: String,
    description:String,
    self_link:String,
    updated_at: Date
});



module.exports = School;