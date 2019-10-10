var Link = require('../models/Link');
var Menu = require('../models/Menu');
const Course = require("../models/Course")
const Content = require("../models/Content")
const Category = require("../models/Category")
const School = require("../models/School")


class ResourcesRepository{

    async getFullResorcesArray() {
        
        var array = [];

        var courses = await Course.findAsync()

        array.push(courses)

        var contents = await Content.findAsync()

        array.push(contents)

        var categories = await Category.findAsync()

        array.push(categories)

        var schools = await School.findAsync()

        array.push(schools)

        return array;

    }

}


module.exports = new ResourcesRepository()