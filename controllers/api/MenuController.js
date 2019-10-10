const MenuRepository = require("../../repositories/MenuRepository")
const LinkRepository = require("../../repositories/LinkRepository")
const CollectHelper = require("../../helpers/collect-helper")
const Link = require("../../models/Link");
const Menu = require("../../models/Menu");
var slug = require('slug')

class MenuController{

    getFullMenuListData(req,res){
        MenuRepository.getMenus().then(data=>{
            return res.json(data)
        }).catch(err=>{
            console.log(err)
        })
    }

    getMenuLinks(req,res){
        MenuRepository.getMenuLinksData(req.params.id).then(data=>{
            return res.json(data.links_json)
        }).catch(err=>{
            console.log(err)
        })
    }

    getMenusFlatLinks(req,res){
        MenuRepository.getMenusAndFlatLinks().then(response=>{
            return res.json(response)
        }).catch(err=>{
            console.log(err)
        })
    }


    updateMenuField(req,res){
        var mid = req.params.id;
        var value = req.body.value;
        var field = req.body.field;
        if(field=='links_json'){
            value = CollectHelper.filterJsonLinksData(JSON.parse(req.body.value),[])
        }
        // return res.json(JSON.parse(req.body.value));
        Menu.get(mid,(err,nL)=>{
            nL[field] = value;
            nL.save();
            return res.json(nL);
        })
    }


    getMenu(req,res){
        Menu.get(req.params.id,(err,m)=>{
            console.log('errorGetMenu',err)
            return res.json(m);
        })
    }

    addLinkToMenu(req,res){

        var data = req.body;

        MenuRepository.addLinkToMenu(data).then(d=>{
            return res.json(d);
        })

        
    }


    addLink(req,res,next){

        var data = req.body;

        Link.create({
            title:data.name,
            alias:slug(data.name,{lower:true}),
            path:'',
            data_type:'blank'
            },(err,l)=>{
            // console.log(err)
            // console.log(l)
            req.link = l;
            next()
    
        })

        
    }


    addNewLinkToMenu(req,res){

        var data = req.body;

        MenuRepository.addNewLinkToMenu(data,req.link).then(d=>{
            return res.json(d);
        }).catch(err=>{
            console.log(err)
        })

        
    }


    linkRemoveFromJson(req,res,next){
        MenuRepository.removeLinkFromJsons(req.params.id).then(d=>{
            next()
        }).catch(err=>{
            console.log(err)
        })
    }

    removeLinkFromBase(req,res){
        Link.get(req.params.id,(err,L)=>{
            L.remove((err)=>{
                return res.json({success:true})
            })
        })
    }


    removeLinkFromMenu(req,res){
        var data = req.body
        MenuRepository.removeLinkFromOneMenuJson(data.linkId,data.menuId).then(d=>{
            return res.json(d)
        }).catch(err=>{
            console.log(err)
        })
    }

    getMenuList(req,res){
        MenuRepository.getMenusList().then(d=>{
            return res.json(d)
        })
    }

}


module.exports = new MenuController()