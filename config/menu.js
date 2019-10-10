const menu = [
    {
        title:"Diety",
        uri:'/diety',
        withChildren:"diets",
        metaDescription:"",
        metaKeywords:"",
        childrenIds:[],
        childrenAll:true,
        children:[
            {
                title:'Standard',
                uri: '/diety/standard'
            },
            {
                title:'Kids',
                uri: '/diety/kids'
            },
            {
                title:'Detoks',
                uri: '/diety/detoks'
            },
            {
                title:'Vege',
                uri: '/diety/vege'
            },
            {
                title:'Gluten Free',
                uri: '/diety/gluten-free'
            },
            {
                title:'Sport',
                uri: '/diety/sport'
            },
            {
                title:'Specjalna',
                uri: '/diety/specjalna'
            }
        ]
    },
    {
        title:"O nas",
        uri:'/o-nas',
        metaDescription:"",
        metaKeywords:""
    },
    {
        title:"Trening",
        uri:'/trening',
        metaDescription:"",
        metaKeywords:"",
        withChildren:'articles',
        childrenIds:[3,2],
        childrenAll:false,
        children:[
            {
                title:'Trening personalny',
                uri: '/trening-personalny,3'
            },
            {
                title:'Plany treningowe',
                uri: '/plany-treningowe,2'
            }
        ]
    },
    {
        title:"Konsultacje dietyczne",
        uri:'/konsultacje-dietetyczne,1',
        metaDescription:"",
        metaKeywords:""
    },
    {
        title:"Promocje",
        uri:'/promocje',
        metaDescription:"",
        metaKeywords:""
    },
    {
        title:"Kontakt",
        uri:'/kontakt',
        metaDescription:"",
        metaKeywords:""
    }
];

module.exports = menu;