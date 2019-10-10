var slug = require('slug')
const School = require('../../models/School')
const Course = require('../../models/Course')
const SchoolRepository = require('../../repositories/SchoolRepository')

class SchoolsController{

    getSchools(req,res){
        School.findAsync({}).then(ss=>{
            return res.json(ss)
        }).catch()
    }

    setSelfPath(req,res){
        var data = req.body;
        School.getAsync(data.id).then(s=>{
            s.self_link = data.path;
            s.save();
            return res.json(s)
        })
    }

    getSchoolCourses(req,res){

        Course.find({school_id:req.params.id}).order('ordering').all((err,s)=>{
            return res.json(s)
        })
    }

    addCourseToSchool(req,res){
        var data = req.body;
        SchoolRepository.setNewSchoolCourse(data).then(d=>{
            return res.json(data)
        })
    }

    makeSchoolCoursesOrder(req,res){
        var data = req.body;
        SchoolRepository.makeCoursesOrder(data).then(d=>{
            return res.json({success:true})
        })
    }

}

module.exports = new SchoolsController()