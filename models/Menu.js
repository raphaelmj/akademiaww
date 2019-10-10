const db = require('../config/db-orm');
const Link = require('./Link');

var Menu = db.define("menu", {
    name:String,
    alias:String,
    level:Number,
    links_json:Object,
    // all_links_json:Object,
    updated_at: Date
});

Menu.hasMany("link", Link, { why: String }, { reverse:'menu', key: true, autoFetch : true });


module.exports = Menu;