//const fs = require('fs');
const router = require('express').Router();
const path = require('path');
var { graphql } = require('graphql');
var schema = require('./graphql').schema;
var root = require('./graphql').root;
//const connect = require('./config/db').connect;
//const MysqlQueryImport = require('./helpers/mysql-query-import')
//const CollectHelper = require('./helpers/collect-helper')
//const cache = require('./config/cache')
//const secret = require('./config/secret')
//const jwt = require('jsonwebtoken');


// router.get('/:a/:b?/:c?',(req,res)=>{

//   let query = `{course(id:1){id}}`

//   graphql(schema, query,root).then(result => {
//     res.json(result);
//   });

// })

router.get('/:a/:b?/:c?',(req,res)=>{
  return res.json(req.params);
})


// router.get('/import/data', (req,res,next)=>{

//   MysqlQueryImport.getMenuTypes().then(result=>{
//     req.data = result;
//     next();
//   })

  
// },(req,res)=>{
  
//   var text = ''

//   req.data.forEach(element => {
//     text+='<a href="/import/menu/'+element.menutype+'">'+element.title+'</a>';
//     text+='<hr>';
//   });

//   return res.send(text);
  
// });

// router.get('/import/menu/:type',(req,res,next)=>{

//   MysqlQueryImport.createMenuForLinks(req.params.type).then((data)=>{
//     next()
//   });

// }, (req,res,next)=>{

//   MysqlQueryImport.createCacheMenu(req.params.type).then((data)=>{
//     req.data = data;
//     next()
//   });

// },(req,res)=>{
  
//     var menuLevel = CollectHelper.checkArrayLevelChildren(req.data);
//     console.log(menuLevel);
    
//     return res.json(req.data);
// });

// router.get('/google3d7bd6a1ec9040d4.html',function(req,res){
//   return res.send('google-site-verification: google3d7bd6a1ec9040d4.html');
// });

// router.get('/sitemap.xml',function(req,res){

//   fs.readFile( './sitemap.xml', function(err, data) {
//     res.type('application/xml');
//     return res.send(data)
//   });

// });







module.exports = router;
