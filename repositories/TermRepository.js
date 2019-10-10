const db = require('../config/db-orm');
const Term = require("../models/Term");
const Course = require("../models/Course");
const { map } = require('p-iteration');

class TermRepository{

    async getTermsByCriteria(crt){

        if(crt.targetType=='course'){
        
            if(crt.courseId==null){
                var trs = await Term.find({})
            }else{
                var trs = await Term.find({course_id:crt.courseId})
            }
            
            if(crt.fromDate!=null)
                trs.where("start_day_at > ?",[crt.fromDate])

            if(crt.toDate!=null)
                trs.where("start_day_at < ?",[crt.toDate])

            return trs.findAsync()    

        }else if(crt.targetType=='school'){

            var sql = 'SELECT * FROM term';

            var courses = await Course.findAsync({school_id:1})
       
            if(courses.length>0){
                sql+= " WHERE (";
            }
 
            courses.map((c,i)=>{
                if(i==0){
                    sql+= "course_id="+c.id;

                }else if(i!=(courses.length-1)){
                    sql+= " OR course_id="+c.id;
                }else{
                    sql+= " OR course_id="+c.id+")"
                }
                
            })

            if(crt.fromDate!=null || crt.toDate!=null){

                if(courses.length>0){
                    sql+= " AND "
                }else{
                    sql+=" WHERE ";
                }
                
                if(crt.fromDate!=null)
                    sql+="start_day_at>"+crt.fromDate

                if(crt.fromDate!=null && crt.toDate!=null){   
                    sql+=" AND "
                }

                if(crt.toDate!=null)
                    sql+="start_day_at<"+crt.toDate

            }


            return await db.driver.execQueryAsync(sql)
            
            

        }else{
            return await Term.findAsync({})
        }

        

    }


}

module.exports = new TermRepository()