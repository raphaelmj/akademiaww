const db = require('../config/db-orm');
const Content = require('./Content');
const Course = require('./Course');
const School = require('./School');
const Category = require('./Category');
const Menu = require('./Menu');


var Link = db.define("link", {
    link_id: Number,
    content_id: Number,
    course_id: Number,
    category_id: Number,
    school_id: Number,
    title: String,
    alias: String,
    path: String,
    data_type: String,
    external_link:String,
    status: Number,
    view:String,
    linked_menu:String,
    params:String,
    custom_title:String,
    meta_desc:String,
    meta_keywords:String,
    ordering:Number,
    updated_at: Date
});

Link.hasOne('link', Link, {reverse:'links'})
Link.hasOne('content', Content, {reverse:'links'})
Link.hasOne('category', Category, {reverse:'links'})
Link.hasOne('school', School, {reverse:'links'})
Link.hasOne('course', Course,{reverse:'links'})
Link.hasMany("menu", Menu, { why: String }, { reverse:'links', key: true, autoFetch : true });


module.exports = Link;