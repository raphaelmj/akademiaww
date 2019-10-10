var slug = require('slug')
var TermRepository = require('../../repositories/TermRepository');

class TermController{

    getTermsByCriteria(req,res){
        var data = req.body;
        TermRepository.getTermsByCriteria(data).then(d=>{
            return res.json(d)
        })
        
    }

}


module.exports = new TermController()