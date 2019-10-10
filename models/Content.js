const db = require('../config/db-orm');
const Category = require('./Category');

var Content = db.define("content", {
    category_id: Number,
    title: String,
    alias: String,
    image: String,
    intro: String,
    content: String,
    status: Number,
    self_link:String,
    updated_at: Date
});

Content.hasOne('category', Category, {reverse: 'contents'})

module.exports = Content;