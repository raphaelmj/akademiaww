const connect = require('../config/db').poolConnect;
const cache = require('../config/cache')
const { map } = require('p-iteration');

class MysqlQueryImport{

    constructor() {

    }

    async createCacheMenu(menu){

        return await this.getMenuLinks(1,0,[],menu,0);
        
    }

    async getMenuLinks(parent_id,i,array,menu,level){

        // var res = await connect.query("select id,title,parent_id from v7ik1_menu where menutype='"+menu+"' and parent_id="+parent_id)

        if(parent_id==1){
            array = await connect.query("select * from v7ik1_menu where menutype='"+menu+"' and parent_id="+parent_id);
            level++
            await map(array, async (item,iter)=>{
                array[iter].linkData = this.parseLinkData(item.link)
                return await this.getMenuLinks(item.id,iter,array[iter],menu,level)
            })
        }else{
            array['children'] = await connect.query("select * from v7ik1_menu where menutype='"+menu+"' and parent_id="+parent_id);
            if(array['children'].length>0){
                level++
                await map(array['children'], async (item,iter)=>{
                    array['children'][iter].linkData = this.parseLinkData(item.link)
                    return await this.getMenuLinks(item.id,iter,array['children'][iter],menu,level)
                })
            }
        }

        await cache.set(menu, JSON.stringify(array))
        // cache.set(menu, JSON.stringify(array), function (error) {

        //     if (error) throw error;

        // })
        return array;

        
    }

    async getMenuTypes(){
        var menus = await connect.query("select * from v7ik1_menu_types");
        return menus;
    }

    parseLinkData(link){

        var sLink = link.split('&');

        var dataLink = {

        }

        if(sLink.length==2){

            dataLink.type = sLink[1].split("=")[1];
    
        }else if(sLink.length==3){

            dataLink.subView = null;
            dataLink.type = sLink[sLink.length-2].split("=")[1]

        }else if(sLink.length==4){
            
            var subView = sLink[2].split('=')[1].split(':')[1];

            dataLink.subView = subView;
            dataLink.type = sLink[sLink.length-3].split("=")[1]+"-course"

        }


        if(dataLink.type!='featured' && dataLink.type!='archive'){
            dataLink.id = sLink[sLink.length-1].split("=")[1]
        }else{
            dataLink.id = null;
        }

        return dataLink;
    }


    async createMenuForLinks(menutype){
        var menu = await connect.query("select * from v7ik1_menu_types where menutype='"+menutype+"'");
        // console.log(menu[0])
    }


}


module.exports = new MysqlQueryImport();