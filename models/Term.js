const db = require('../config/db-orm');
const Course = require('./Course');
const LearnTime = require('./LearnTime');

var Term = db.define("term", {
    course_id: Number,
    learn_term_id: Number,
    time_type: String,
    work_type: String,
    start_day_at: Date,
    end_day_at: Date,
    start_time_at: Date,
    end_time_at: Date,
    updated_at: Date
});

Term.hasOne('course', Course, {reverse:'courses'})
Term.hasOne('learn_term', LearnTime,{reverse:'learn_time'})

module.exports = Term;