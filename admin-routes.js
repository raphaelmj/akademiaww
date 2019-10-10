const router = require('express').Router();

router.get('/', (req,res)=>{
    return res.render('ngadmin');
});

module.exports = router;