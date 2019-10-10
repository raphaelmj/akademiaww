const db = require('../config/db-orm');
var Link = require('../models/Link');
var Menu = require('../models/Menu');
const Course = require("../models/Course")
const Content = require("../models/Content")
const Category = require("../models/Category")
const School = require("../models/School")
const { map } = require('p-iteration');


class SchoolRepository{

    async setNewSchoolCourse(data){

        var c = await Course.find({school_id:data.schoolId}).order('-ordering').first((err,c)=>{
            
            if(c){
                if(c.ordering==null){
                    var nOrd = 1;
                }else{
                    var nOrd = c.ordering+1;
                }
            }else{
                var nOrd = 1;
            }

            Course.getAsync(data.id).then(cu=>{
                cu.school_id = data.schoolId;
                cu.ordering = nOrd;
                cu.save()
                return cu;
            })

        })
        


    }

    async makeCoursesOrder(data){

        
        await map(data.courses, async (c,i)=>{

            var c  = await Course.getAsync(c);
            c.ordering = i+1;
            await c.save();

        })

        return true;
        
    }

}

module.exports = new SchoolRepository()