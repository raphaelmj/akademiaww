const program = require('commander');
const faker = require('faker');
const urlencode = require('urlencode');
const fs = require('fs');
const https = require('https');
const localStorage = require('localStorage')
const connect = require('../config/db').connect;
const poolConnection = require('../config/db').poolConnect;
const domain = require('../config/domain');
const salt = require('../config/salt');
const randomInt = require('random-int');
const bcryptjs = require('bcryptjs');
const MysqlQueryImport = require('../helpers/mysql-query-import')
const curl = new (require( 'curl-request' ))();
const { map } = require('p-iteration');
var orm = require("orm");
var Test = require("../helpers/test");
var LinkRepository = require("../repositories/LinkRepository")
var Link = require("../models/Link");
var Menu = require("../models/Menu");
var School = require("../models/School");
var Course = require("../models/Course");
var Term = require("../models/Term");
var User = require("../models/User");
var Password = require("../helpers/password");
var slug = require('slug')
const db = require('../config/db-orm');

program
    .command('import-menu')
    .option('--menu-type')
    .action(function (menu) {
        // const stream = fs.readFileSync('./links.json','utf8');
        // var links = JSON.parse(stream);
        // console.log(links);

        MysqlQueryImport.getMenuTypes().then(res=>{


            var url = 'http://localhost:3000/import/menu/'+menu;
            curl
                .get(url)
                .then(({statusCode, body, headers}) => {
                    // console.log(statusCode, body, headers)
                    console.log(body)
                })
                .catch((e) => {
                    console.log(e);
                });
    
        })

        
    })


program
    .command('check-orm')
    .action(()=>{
        // Test.connectToDatabase();
        // Test.checkSchoolModel()
        Test.checkLinkModel()
    })

program
    .command('menu-create')   
    .action(()=>{
        // Test.connectToDatabase();
        // Test.checkSchoolModel()
        // Test.checkLinkModel()
        var array = [2,3,4,5,9];
        connect.query("select * from v7ik1_menu_types",(err,menu)=>{
            menu.forEach(element => {
                if(array.includes(element.id)){
                    Menu.create({
                        name:element.title,
                        alias:element.menutype,
                        links_json:JSON.stringify([])
                    },(err,m)=>{
                        // console.log(err);
                        // console.log(m);
                        
                    })
                }
            });
        });
        

    }) 

program
    .command('create-links')   
    .option('--menu')
    .option('--parent')
    .action((menut,parent)=>{    

        // console.log(menut)

        connect.query("select * from v7ik1_menu where menutype='"+menut+"'",(err,links)=>{

            // console.log(links)
            links.forEach((el,i) => {
                // console.log(el)

                var parseLink = MysqlQueryImport.parseLinkData(el.link)
                var data_type;

                if(parseLink.type=='article'){
                    data_type="school"
                }else if(parseLink.type="article-course"){
                    data_type="course"
                }

                var lid = null;
                if(i!=0){
                    lid=parent
                }

                    Link.create({
                        link_id:lid,
                        title:el.title,
                        alias:el.alias,
                        path:el.path,
                        data_type:data_type
                    },(err,l)=>{
                        // console.log(err);
                        // console.log(l.id);
                        // console.log(Menu.find({alias:menut}))
                        Menu.find({alias:menut},(err,menu)=>{
                            var link = Link(l.id)
                            menu[0].setLinks([link],(error,m)=>{
                                console.log(error);
                                console.log(m);
                            })
                        });
                        
                    })
                
            })
        
        });
    })

program
    .command('create-school')   
    .option('--link')
    .option('--school')  
    .action((link,school)=>{    
        
        Link.oneAsync({id:link})
        .then(function(l) {
            console.log(l.path)

            School.create({
                name:school,
                alias:slug(school,{lower:true}),
                self_link:l.path
            },(err)=>{
                db.close()
            })


        });
        
    })



program
    .command('add-course')   
    .option('--school')  
    .option('--course') 
    .option('--link')   
    .action((school,course,link)=>{    
        
        connect.query("select * from v7ik1_content where id='"+course+"'",(err,c)=>{
            var content = c[0].introtext.split('<hr />')
            // console.log(content[0])
            // console.log(content[2])
            Link.oneAsync({id:link})
                .then(function(l) {
                    Course.create({
                        school_id:school,
                        name:c[0].title,
                        alias:c[0].alias,
                        description:content[0],
                        summary_description:(content.lengt>2)?content[2]:'',
                        self_link:l.path
                    },(err2,co)=>{
    
                        Link.get(link, (err3, MyLink)=>{
                            MyLink.course_id = co.id
                            MyLink.save(function (err) {
                                console.log("saved!");
                                db.close()
                            })
                        })
                    })
            })
        })
        
    })    

program
    .command('add-user')   
    .option('--user')  
    .option('--password')   
    .action((user,password)=>{ 

        Password.getHash(password).then((hash)=>{
            User.create({
                login:user,
                password:hash,
                status:1
            },(err,u)=>{
                db.close();
                console.log(u)
            })
        })

    })

program
    .command('update-user')   
    .option('--user')  
    .option('--password')   
    .action((user,password)=>{ 

        Password.getHash(password).then((hash)=>{
            console.log(hash)
            User.get(user,(err,U)=>{
                U.password = hash;
                U.save();
                db.close()
            })
        })

    })    

program
    .command('update-user')   
    .option('--user')  
    .option('--password')   
    .action((user,password)=>{ 

        Password.getHash(password).then((hash)=>{
            console.log(hash)
            User.get(user,(err,U)=>{
                U.password = hash;
                U.save();
                db.close()
            })
        })

    })  
    
program
    .command('add-link-to-menu')   
    .option('--link')  
    .option('--menu')   
    .action((link,menu)=>{ 

        // Link.get(link,(err,l)=>{
            
        //     Menu(menu).addLinks([l],(err,r)=>{
        //         console.log(r)
        //     })

        // })

        // Menu.get(menu,(err,m)=>{
        //     m.links_json = JSON.stringify(m.links)
        //     m.save()
        // })
        
        // School.getAsync(11).then(r=>{
        //     console.log()
        // })

    })     
    
    
program
    .command('create-terms')
    .action((link,menu)=>{ 

        for(var i=0;i<200;i++){

            if(faker.random.boolean()){


                var date = faker.date.between('2019-01-01', '2019-07-25');

                var work_types = [
                    'group',
                    'binary',
                    'single'
                ]
                
                var intR = faker.random.number({
                    'min': 5,
                    'max': 30
                })

                var termId = faker.random.number({
                    'min': 1,
                    'max': 3
                })

                var courseId = faker.random.number({
                    'min': 10,
                    'max': 34
                })

                var workKey = faker.random.number({
                    'min': 0,
                    'max': 2
                })

                var obj = {
                    course_id:courseId,
                    learn_term_id:termId,
                    time_type:'inherit',
                    work_type:work_types[workKey],
                    start_day_at:date
                }
                
                date.setDate(date.getDate()+intR)

                obj.end_day_at = date;

            }else{

                var courseId = faker.random.number({
                    'min': 10,
                    'max': 34
                })

                var start = faker.random.number({
                    'min': 9,
                    'max': 17
                })

                var plusStart = faker.random.number({
                    'min': 3,
                    'max': 5
                })

                var obj = {
                    course_id:courseId,
                    time_type:'custom',
                    work_type:work_types[workKey],
                    start_day_at:date,
                    start_time_at: start+':00:00',
                    end_time_at: (start+plusStart)+':00:00',
                }

                date.setDate(date.getDate()+intR)
                obj.end_day_at = date;


            }



            Term.create(obj, function (err, item) {
                console.log(err,item)
            });


        }
        
        // console.log(dateFrom,dateTo);
    })

program.parse(process.argv)

