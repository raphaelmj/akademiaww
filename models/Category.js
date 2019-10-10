const db = require('../config/db-orm');


var Category = db.define("category", {
    name     : String,
    alias  : String,
    self_link:String,
    updated_at: Date
});



module.exports = Category;