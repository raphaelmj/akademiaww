const router = require('express').Router();
const AuthController = require("./controllers/api/AuthController")
const LinksController = require("./controllers/api/LinksController")
const MenuController = require("./controllers/api/MenuController")
const SchoolsController = require("./controllers/api/SchoolsController")
const CoursesController = require("./controllers/api/CoursesController")
const TermController = require("./controllers/api/TermController")
const MenuRepository = require("./repositories/MenuRepository")

const authmiddleware = require("./middlewares/admin/authmiddleware")

router.get('/', authmiddleware, (req,res)=>{
    return res.send('api')
});

router.post('/login', AuthController.login);
router.get('/check/auth',AuthController.checkLogin)
router.get('/get/links/full/data',LinksController.getLinksListFullData)
router.get('/get/links',LinksController.getLinksList)
router.get('/get/links/tree',LinksController.getTree)
router.get('/get/menu/:id',MenuController.getMenu);
router.get('/get/menus/full',MenuController.getFullMenuListData)
router.get('/get/menus/flat/links',MenuController.getMenusFlatLinks)
router.get('/get/menu/links/:id',MenuController.getMenuLinks)
router.get('/get/menus/list',MenuController.getMenuList);
router.get('/get/link/resource/:id',LinksController.getLinkResource)
router.get('/get/data/resources',LinksController.getResourcesData)
router.put('/update/menu/field/:id',MenuController.updateMenuField)
router.post('/change/link/order',LinksController.changeLinksOrder)
router.post('/create/new/link',LinksController.createNewLink)
router.post('/check/is/link/path/free',LinksController.checkIsPathFree)
router.post('/update/link/refactor/menus',LinksController.updateLinkData,LinksController.updateMenusAfterLinkChange)
router.post('/change/link/type',LinksController.linkUpdateType,LinksController.updateMenusAfterLinkChangeType)
router.post('/add/new/link/to/menu',MenuController.addLink,MenuController.addNewLinkToMenu)
router.post('/add/link/to/menu',MenuController.addLinkToMenu)
router.delete('/remove/link/:id',MenuController.linkRemoveFromJson,MenuController.removeLinkFromBase)
router.post('/menu/remove/link',MenuController.removeLinkFromMenu)


router.get('/get/schools',SchoolsController.getSchools)
router.put('/change/school/self/link',SchoolsController.setSelfPath)
router.get('/get/school/courses/:id',SchoolsController.getSchoolCourses)
router.put('/add/course/to/school',SchoolsController.addCourseToSchool)
router.post('/make/school/courses/order',SchoolsController.makeSchoolCoursesOrder)

router.get('/get/courses',CoursesController.getCourses)

router.post('/get/terms/by/criteria',TermController.getTermsByCriteria)

module.exports = router;