var slug = require('slug')
const CourseRepository = require('../../repositories/CourseRepository')
const School = require('../../models/School')
const Course = require('../../models/Course')


class CoursesController{

    getCourses(req,res){
        CourseRepository.getCourseWithSchool().then(d=>{
            return res.json(d)
        })
    }

}


module.exports = new CoursesController()