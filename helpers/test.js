// var User = require('../models/User');
var Link = require('../models/Link');
// var Category = require('../models/Category');
// var Content = require('../models/Content');
// var School = require('../models/School');
// var Course = require('../models/Course');
var Menu = require('../models/Menu');

const db = require('../config/db-orm');

class Test{

    async checkSchoolModel(){

        // School(1).getCourses((err,ctr)=>{
        //     console.log(ctr)
        // })
        
    }

    async checkLinkModel(){

        // Course(1).getLinks((err,l)=>{
        //     console.log(l)
        // })

        // Content(1).getCategory((err,cat)=>{
        //     console.log(cat)
        // })

        // Category(1).getLinks((err,dt)=>{
        //     console.log(dt)
        // })

        // Link(1).getCategory((err,dt)=>{
        //     console.log(dt)
        // })

        // Menu.sync()
        // Link.sync()
        var menu = Menu(5)
        var l = Link(2)
        // console.log(menu)
        // console.log(l)
        // menu.setLinks([l],(err,ls)=>{
        //     console.log(err)
        //     console.log(ls)
        // })
        // Link.all().remove();
        // menu.getLinks((err,ls)=>{
        //     console.log(err)
        //     console.log(ls)
        // })
        // l.setMenus([menu],(err,ls)=>{
        //     console.log(err)
        //     console.log(ls)
        // })
        // Link(2).remove()
        // l.getMenus((err,ls)=>{
        //     console.log(err)
        //     console.log(ls)
        // })
        // console.log(menu.setLinks())
        // console.log(l.getMenus())
        menu.addLinks([l],function(err) {
            console.log(err)
        })
        // menu.removeLinks(l,function(err) {
        //     console.log(err)
        // })
        
        // Link(2).getLink((err,res)=>{
        //     console.log(res.title)
        //     // res.forEach(element => {
        //     //     console.log(element.title)
        //     // });
        // })

    }

    async connectToDatabase(){

        
        // var user = await User.findAsync(4);
        // console.log(user[0].id)
        // console.log('end')

        // db.close()

        // User.create({ login: "John", password: "Doe",status:1 },(err,res)=>{
        //     db.close()
        //     // console.log(res.id)
        // })

        // var cat = await Category.findAsync(1);
        // Content(1).getCategory((err,c)=>{
        //     console.log(err)
        //     console.log(c)
        // })


        // var cnt = await Content.createAsync({ title:'lsd',alias:'lsd-3',status:1 })

        // console.log(cnt)
        
        // Category(1).setContents(cnt,(err,c)=>{
        //     console.log(err)
        //     console.log(c)
        // })

        // Category(1).getContents((err,c)=>{
        //     // console.log(err)
        //     // console.log(c)
        //     c.forEach(element => {
        //      console.log(element.id)   
        //     });
        // })

        
        // db.close()
    }

}


module.exports = new Test();