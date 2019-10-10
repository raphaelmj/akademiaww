const MenuRepository = require("./MenuRepository")
const db = require('../config/db-orm');
var Link = require('../models/Link');
var Menu = require('../models/Menu');
const Course = require("../models/Course")
const Content = require("../models/Content")
const Category = require("../models/Category")
const School = require("../models/School")
const { map } = require('p-iteration');
var slugify = require('slugify')

class LinkRepository{

    async linkOrderReBuild(data){

        await map(data.links, async (el,i)=>{
            if(el.id!=null){
                var ToUpdate = await Link.getAsync(el.id);
                // console.log(ToUpdate)
                ToUpdate.ordering = i+1;
                ToUpdate.save()
            }else{
                const newRecord = {
                    link_id:el.link_id,
                    title:el.title,
                    alias:slugify(el.title,{lower:true}),
                    path:'',
                    data_type:'article',
                    ordering:i
                }
                var link = await Link.createAsync(newRecord)
                // var menu = await Menu(data.menu_id)
                var l = await Link(link.id)
        
                // menu.addLinks([l],function(err) {
                //      console.log(err)
                // })
    
            }

            // console.log(ToUpdate.ordering,ToUpdate.title)
        })

    }

    async createNewLink(data){
        // console.log(data)
        const newRecord = {
            link_id:data.link_id,
            title:data.title,
            alias:slugify(data.title),
            path:'',
            data_type:'blank',
            ordering:1
        }
        var link = await Link.createAsync(newRecord)
        // var menu = await Menu(data.menu_id)
        // var l = await Link(link.id)

        // menu.addLinks([l],function(err) {
        //      console.log(err)
        // })
    }

    //article,course,school,category,course-list

    async getLinksWithDataFull(){
        var ls = await Link.findAsync()
        await map(ls, async (el,i)=>{
            ls[i].resource = await this.getLinkData(el.id)
        })
        return ls;
    }

    async getLinkData(id){

        var l = await Link.getAsync(id)
        // console.log(l.data_type)
        // console.log(l.course_id)
        var linked_menu = await this.getMenusLinkedIfExits(l.linked_menu)

        l.linked_menu = linked_menu;

        switch(l.data_type){

            case 'article':
                if(l.content_id!=null){
                    var c = await Content.getAsync(l.content_id);
                    return {type:'article',data:c, link:l}
                }else{
                    return {type:'article',data:null, link:l}
                }
            break;

            case 'course':

                if(l.course_id!=null){
                    var c = await Course.getAsync(l.course_id)
                    return {type:'course',data:c, link:l}
                }else{
                    return {type:'course',data:null, link:l}
                }

            break;

            case 'category':
                if(l.category_id!=null){
                    var c = await Category.getAsync(l.category_id)
                    return {type:'category',data:c, link:l}
                }else{
                    return {type:'category',data:null, link:l}
                }
            break;

            case 'school':
                if(l.school_id!=null){
                    var c = await School.getAsync(l.school_id)
                    return {type:'school',data:c, link:l}
                }else{
                    return {type:'school',data:null, link:l}
                }
            break;

            case 'school-list':
                var c = await School.findAsync()
                return {type:'school-list',data:c, link:l}
            break;

            case 'external-link':
                return {type:'external-link',data:c, link:l}
            break;

            case 'blank':
                return {type:'blank',data:null, link:l}
            break;

            default:
                return {type:'404',data:null, link:l}
            break;
        }

    }

    async getMenusLinkedIfExits(lm){

        if(lm==null || lm==undefined){
            return null;
        }
        var arr = JSON.parse(lm)
        var collect = []
        await map(arr, async(id)=>{
            var m = await Menu.getAsync(id)
            collect.push(m)
        })

        return collect;

    }

    async isPathExist(path,oldPath){
        // console.log(oldPath)
        var l = await Link.findAsync({path:path});
        if(l.length>0){
            var bool = false;
            await map(l, async link =>{
                if(link.path==oldPath){
                    bool=true;
                }
            })

            return {bool:bool,l:l}
        }else{
            return {bool:true}
        }
        
    }

    async updateLinkDataByType(data){

        if(data.type=="external-link"){

            var l = await Link.getAsync(data.id);
            l.title = data.title;
            l.title = slugify(data.title,{lower:true});
            l.external_link = data.external_link;
            await l.save()

        }else{
            var l = await Link.getAsync(data.id);
            l.title = data.title;
            l.alias = slugify(data.title,{lower:true});
            l.path = data.path;
            l.view - data.view;
            l.meta_desc = data.meta_desc;
            l.meta_keywords = data.meta_keywords;
            l.custom_title = data.custom_title;
            l.linked_menu = this.getOnlyMenusId(data.linked_menu)
            l.view = data.view;
            await l.save()
        }

        return l;

    }

    getOnlyMenusId(ms){
        if(ms==null)
            return null;

        var collect = [] 
        ms.forEach(element => {
            collect.push(element.id)
        });    

        return JSON.stringify(collect)
    }

    async updateLinkDataType(data){

        var l = await Link.getAsync(data.id);
     
        // console.log(data.type)
        switch(data.type){

            case 'article':

                l.content_id = data.data.id;
                l.data_type = 'article';
                await l.save();

            break;

            case 'course':

                l.course_id = data.data.id;
                l.data_type = 'course';
                await l.save();

            break;

            case 'category':
                l.category_id = data.data.id;
                l.data_type = 'category';
                await l.save();
            break;

            case 'school':

                l.school_id = data.data.id;
                l.data_type = 'school';
                await l.save();

            break;

            case 'school-list':

                l.data_type = 'school-list';
                await l.save();
        
            break;

            case 'external-link':
                // console.log(data)
                l.external_link= data.data;
                l.data_type = 'external-link';
                await l.save();
            
            break;

            case 'blank':
            
            break;

            default:
             
            break;
        }

        return l;
    }

}


module.exports = new LinkRepository();
