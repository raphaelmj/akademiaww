const router = require('express').Router();
const jwt = require('jsonwebtoken');
const secret = require('../../config/admin-secret');

var redirectifauth = function(req,res,next){

    let cookies = req.cookies;

    if(cookies.authToken){

        let auth = jwt.verify(cookies.authToken,secret)

        if(!auth){
            next();
        }else{
            return  res.redirect('/admin');
        }

    }else{
        next();
    }

}

module.exports = redirectifauth;
