const bcrypt = require('bcryptjs');
const salt = require('../config/salt');

class Password {


   getHash(password){

       return bcrypt.hash(password, salt).then(function(hash) {
           return hash;
       });

   }

   comparePassword(password,hash){
       return bcrypt.compare(password, hash).then(function(res) {
           return res;
       });
   }

}

module.exports = new Password();