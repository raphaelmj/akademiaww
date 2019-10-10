const Menu = require("../models/Menu")
const Link = require("../models/Link")
const arraySort = require('array-sort');
const db = require("../config/db-orm")
const { map } = require('p-iteration');



class MenuRepository{

    async getMenus(){

        var menus  = await Menu.findAsync();
        
        return this.sortLinksMenu(menus);
        

    }


    async getMenusList(){

        var menus  = await Menu.findAsync({});
        var mns = Object.assign([],menus);
        return mns;

    }


    async getMenuLinksData(id){
        var menu = await Menu.oneAsync({id:id});
        menu.links_json = this.sortRec(menu.links,null,[],0)
        return menu;
    }


    async getLinksTree(){

        var lns = await Link.findAsync()
        return this.sortRec(lns,null,[],0)

    }


    sortLinksMenu(menus){

        var mns = Object.assign([],menus);

        mns.forEach((el,i) => {
            
            mns[i].links_json = this.sortRec(el.links,null,[],0)
    
        });
    
        return mns;

    }
    
    
    sortRec(lns,parent_id,array,x){


        var toMap = this.findLinkByIdInArray(parent_id,lns);

        // console.log(parent_id)

        if(toMap.length>0){

            toMap.forEach((el,i) => {

                
            
                if(el.link_id==null){

                    el['children'] = []
                    array.push(el)
                    // lns.splice(i,1);
                    array[i]['children'] = this.setLastAndFirstSign(array[i]['children'])
                    return this.sortRec(lns,el.id,array[i]['children'],i)
                    

                }else{
                    
                    el['children'] = []
                    array.push(el)
                    // lns.splice(i,1); 
                    return this.sortRec(lns,el.id,array[i]['children'],i)
         
                    
                   
                }

            })

        }
        array = arraySort(array,'ordering')
        return this.setLastAndFirstSign(array);
    }

    findLinkByIdInArray(id,array){

        var arr = [];

        array.forEach(el=>{
            if(id==el.link_id){
                arr.push(el)
            }
        })

        return arr;

    }

    setLastAndFirstSign(array){

        var lng = array.length;

        array.map((el,i)=>{
            if(i==0){
                array[i].isFirst = true;
            }else{
                array[i].isFirst = false;
            }
            if(i==(lng-1)){
                array[i].isLast = true;
            }else{
                array[i].isLast = false;
            }
        })

        return array;

    }


    async getMenusAndFlatLinks(){
        var menus  = await Menu.findAsync();

        // map(menus, async (el,i)=>{

        //     var jsonMenu = await this.setJsonInMenu(el);
        //     menus[i].links_json = JSON.parse(el.links_json)

        // })

        return menus
    }


   async setJsonInMenu(el){

    var m = await Menu.getAsync(el.id)

    // el.links.map((l,i)=>{
    //     el.links[i]['children']=[]
    // })

    m.links_json = JSON.stringify(el.links)
    await m.save()
    return m;



   }


   async recurranceMenuJsonUpdate(l,ms){

    await map(ms, async (menu,i)=>{


        var struct  = this.changeJsonMenu(l,menu,menu.links_json)
        var m = await Menu.getAsync(ms[0].id)
        m.links_json = JSON.stringify(struct)
        await m.save()
        ms[i] = m;

    })
    return ms;
   }


   async recurranceMenuJsonUpdateType(l,ms){

    await map(ms, async (menu,i)=>{


        var struct  = this.changeJsonMenuType(l,menu,menu.links_json)
        var m = await Menu.getAsync(ms[0].id)
        m.links_json = JSON.stringify(struct)
        await m.save()
        ms[i] = m;
    })
    return ms;
   }


   changeJsonMenu(link,m,struct){
  
     if(struct){
        struct.forEach((el,i)=>{

            if(el.id==link.id){
                // console.log(link.title)
                var ch = el.children
                struct[i].title = link.title;
                struct[i].external_link = link.external_link;
                struct[i].meta_keywords = link.meta_keywords;
                struct[i].meta_desc = link.meta_desc;
                struct[i].path = link.path;
                struct[i].view = link.view;
                struct[i].custom_title = link.custom_title;
                struct[i].children = ch;
                return struct;
            }else{
                return this.changeJsonMenu(link,m,struct[i].children)
            }
        })

    }

    return struct;

   }


   changeJsonMenuType(link,m,struct){
  
    if(struct){
       struct.forEach((el,i)=>{

           if(el.id==link.id){
               // console.log(link.title)
               var ch = el.children
               struct[i].category_id = link.category_id;
               struct[i].content_id = link.content_id;
               struct[i].course_id = link.course_id;
               struct[i].school_id = link.school_id;
               struct[i].external_link = link.external_link;
               struct[i].data_type = link.data_type;
               struct[i].children = ch;
               return struct;
           }else{
               return this.changeJsonMenuType(link,m,struct[i].children)
           }
       })

   }

   return struct;

  }


  async addLinkToMenu(data){

    var l = await Link.getAsync(data.link.id)
    var m = await Menu.getAsync(data.menuId)

    
    if(m.links_json==null){
        m.links_json = []
    }

    if(m.all_links_json==null){
        m.all_links_json = []
    }

    await m.addLinks([l]);

    m.links_json = JSON.stringify(this.pushLinkToDataMenuJson(m.links_json,l))
    m.all_links_json = JSON.stringify(this.pushLinkToDataMenuJson(m.all_links_json,l))
    
    await m.save()

    return m;

  }


  async addNewLinkToMenu(data,link){


    var l = await Link.getAsync(link.id)
    var m = await Menu.getAsync(data.menuId)

    
    if(m.links_json==null){
        m.links_json = []
    }

    // await m.addLinks([l]);

    if(m.all_links_json==null){
        m.all_links_json = []
    }
    

    m.links_json = JSON.stringify(this.pushLinkToDataMenuJson(m.links_json,l))
    m.all_links_json = JSON.stringify(this.pushLinkToDataMenuJson(m.all_links_json,l))

    await m.save()

    return m;

  }


  pushLinkToDataMenuJson(mj,l){
    mj.push({id:l.id,title:l.title,children:[]})
    return mj
  }

  async removeLinkFromJsons(id){

        var menus = await Menu.findAsync()

        await map(menus,async (m,i)=>{

            var links_copy = Object.assign([],m.links_json)
            var all_links_copy = Object.assign([],m.all_links_json)
            var lns = this.removeLinkFromJsonIfExist(links_copy,id,[])
            var all_lns = all_links_copy.map(el=>el.id!=id)
            // await Menu(m.id).removeLink(id)
            var nm = await Menu.getAsync(m.id)
            nm.links_json = JSON.stringify(lns)
            nm.all_links_json = JSON.stringify(all_lns)
            await nm.save()

        })

        // console.log(menus[3].links_json)

        return id;

   }


   async removeLinkFromOneMenuJson(id,menuId){

        var m = await Menu.getAsync(menuId)

        var links_copy = Object.assign([],m.links_json)
        var all_links_copy = Object.assign([],m.all_links_json)
        var lns = this.removeLinkFromJsonIfExist(links_copy,id,[])
        var all_lns = all_links_copy.filter(el=>el.id!=id)
        await Menu(menuId).removeLink(id)
        var nm = await Menu.getAsync(m.id)
        nm.links_json = JSON.stringify(lns)
        nm.all_links_json = JSON.stringify(all_lns)
        await nm.save()

        return m;

   }

   

   removeLinkFromJsonIfExist(links, id, array){



        links.forEach((l,i)=>{

            if(l.id!=id){
                array[i]=l;
                array[i].children = this.removeLinkFromJsonIfExist(l.children, id, array[i].children).filter((el)=>{ return el.id!=id; });
            }else{

            }

        })

    
    // return array.filter(function(el) { return el; });
    return array.filter((el)=>{ return el.id!=id; });;

   }

}

module.exports = new MenuRepository()