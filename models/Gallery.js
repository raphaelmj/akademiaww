const db = require('../config/db-orm');
const Content = require('./Content');
const Course = require('./Course');

var Gallery = db.define("gallery", {
    content_id: Number,
    course_id: Number,
    title: String,
    gallery_type: String,
    data:Object,
    updated_at: Date
});


Gallery.hasOne('content',Content,{reverse:'contents'});
Gallery.hasOne('course',Course,{reverse:'courses'});

module.exports = Gallery;