const db = require('../config/db-orm');
const School = require('./School');

var Course = db.define("course", {
    school_id: Number,
    name: String,
    alias: String,
    description: String,
    summary_description: String,
    program_json:Object,
    price_json:Object,
    self_link:String,
    ordering:Number,
    updated_at: Date
});

Course.hasOne('school',School,{reverse:'courses'});

module.exports = Course;