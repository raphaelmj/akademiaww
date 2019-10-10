const db = require('../config/db-orm');
var Link = require('../models/Link');
var Menu = require('../models/Menu');
const Course = require("../models/Course")
const Content = require("../models/Content")
const Category = require("../models/Category")
const School = require("../models/School")
const { map } = require('p-iteration');
var slugify = require('slugify')

class CourseRepository{

    async getCourseWithSchool(){
        var cs = await Course.findAsync({})
        await map(cs, async (item,i)=>{
            if(item.school_id!=null){
                cs[i].school = await School.getAsync(item.school_id)
            }else{
                cs[i].school = null;
            }
        })
        return cs
    }

}

module.exports = new CourseRepository()