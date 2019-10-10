var app = angular.module('app',['duScroll']).run(function($rootScope, $document, $log, $window) {

    var body = angular.element(document.getElementsByTagName('body'));

    var slider = angular.element(document.getElementById('slider'));
    var diety = angular.element(document.getElementById('diety'));
    var trening = angular.element(document.getElementById('treining'));
    var onas = angular.element(document.getElementById('vip-catering'));
    var zamow = angular.element(document.getElementById('zamow-diete'));


    //console.log(diety[0].offsetTop);
    //console.log($document.scrollTop());


    if ($document.scrollTop()>130) {
        $('.fixed-nav').addClass('smaller');
    } else {
        $('.fixed-nav').removeClass('smaller');
    }



    if(!$.isEmptyObject(diety[0])) {

        if (diety[0].offsetTop > $document.scrollTop()+400) {
            $('.fixed-nav').removeClass('smaller');
        } else {
            $('.fixed-nav').addClass('smaller');
        }

    }

    //console.log($window.innerWidth);

    $document.on('scroll', function() {

        //console.log($document.scrollTop());

        //console.log('Document scrolled to ', $document.scrollLeft(), $document.scrollTop());
        //console.log(body[0].scrollTop);

        if ($document.scrollTop() > 130) {
            $('.fixed-nav').addClass('smaller');
        } else {
            $('.fixed-nav').removeClass('smaller');
        }


        if (!$.isEmptyObject(diety[0])) {

            if (diety[0].offsetTop <= $document.scrollTop() + 400) {

                $('.fixed-nav').addClass('smaller');

            } else {

                $('.fixed-nav').removeClass('smaller');

            }

        }





        if(!$.isEmptyObject(slider[0])) {


            if (slider[0].offsetTop <= $document.scrollTop()) {
                $("#slider").addClass('activeElement');
            } else {
                $("#slider").removeClass('activeElement');
            }


        }

        if(!$.isEmptyObject(diety[0])) {

            if (diety[0].offsetTop <= $document.scrollTop()) {
                $("#diety").addClass('activeElement');
            } else {
                $("#diety").removeClass('activeElement');
            }

        }


        if(!$.isEmptyObject(trening[0])) {

            if (trening[0].offsetTop <= $document.scrollTop()) {
                $("#trening").addClass('activeElement');
            } else {
                $("#trening").removeClass('activeElement');
            }

        }


        if(!$.isEmptyObject(onas[0])) {

            if (onas[0].offsetTop <= $document.scrollTop()) {
                $("#vip-catering").addClass('activeElement');
            } else {
                $("#vip-catering").removeClass('activeElement');
            }

        }






    });


});


app.config( ['$provide', function ($provide){

    $provide.decorator('$browser', ['$delegate', function ($delegate) {
        $delegate.onUrlChange = function () {};
        $delegate.url = function () { return ""};
        return $delegate;
    }]);

}]);



app.filter('isValid', function() { return function(obj) {

    var bool = true;

    Object.keys(obj).forEach(function(key) {

        if(!obj[key].isValid){

            bool = false;

        }

    });

    return bool;
}});



app.filter('refactorselect', function() { return function(obj) {

    var array = [];

    Object.keys(obj).forEach(function(key){

        array[key] = {value:obj[key].title, name:obj[key].title};

    });


    return array;


}});


app.directive('resize', function ($window) {
    return function (scope, rootScope, element) {
        var w = angular.element($window);
        scope.getWindowDimensions = function () {
            return {
                'h': w.height(),
                'w': w.width()
            };
        };
        scope.$watch(scope.getWindowDimensions, function (newValue, oldValue) {

            scope.windowHeight = newValue.h;
            scope.windowWidth = newValue.w;

            //if(scope.windowWidth<1199){
            //    $(".form-fixed").removeClass('activeForm');
            //    $(".btn-showform").removeClass('hidden');
            //    $('.fixed-nav').addClass('smaller');
            //}

            scope.style = function () {
                return {
                    'height': (newValue.h - 100) + 'px',
                    'width': (newValue.w - 100) + 'px'
                };
            };


        }, true);


        w.bind('resize', function () {
            scope.$apply();
        });
    }
});


app.factory('AppService', function($location) {
    return {
        url : $location.protocol()+'://'+$location.host()
    };
});



app.run(function($rootScope, $document, $log, $window) {



    //if($document.scrollTop()>260){
    //    document.getElementById('menu-fixed').className = 'fixed-nav-menu show-menu';
    //}else{
    //    document.getElementById('menu-fixed').className = 'fixed-nav-menu';
    //}
    //
    //$document.on('scroll', function() {
    //
    //
    //    if($document.scrollTop()>260){
    //        document.getElementById('menu-fixed').className = 'fixed-nav-menu show-menu';
    //    }else{
    //        document.getElementById('menu-fixed').className = 'fixed-nav-menu';
    //    }
    //
    //})

});


app.controller('BodyController', ['$scope', '$rootScope', '$interval','$document','$element','$attrs', '$http','$location', '$window', '$filter', '$log', function($scope, $rootScope, $interval, $document, $element, $attrs, $http, $location, $window, $filter,$log){


}]);


app.filter('toPrice', function() { return function(string) {
    return parseFloat(string).toFixed(2)+' PLN';
}});

app.filter('onlyNameId', function() { return function(obj) {
    return {name:obj.name,value:obj.id}
}});





app.controller('ContactFixedController', ['$scope', '$rootScope', '$interval','$document','$element','$attrs', '$http','$location', '$window', '$filter', '$log','AppService', function($scope, $rootScope, $interval, $document, $element, $attrs, $http, $location, $window, $filter,$log,AppService){

    $scope.initData = function (){

        $scope.data = {
            name:'',
            clientemail:'',
            phone:'',
            reg:false,
            message:''
        }

        $scope.valid = {
            name:{
                className:'',
                isValid:false
            },
            clientemail:{
                className:'',
                isValid:false
            },
            reg:{
                className:'',
                isValid:false
            },
            message:{
                className:'',
                isValid:false
            }
        }

    }


    $scope.setReg = function (boolean) {

        $scope.data.reg = boolean;
        $scope.valid.reg.isValid = boolean;

        if(boolean) {
            $scope.valid.reg.className = '';
        }else{
            $scope.valid.reg.className = 'no-reg';
        }

    }


    $scope.checkName = function(){

        //console.log($scope.values.txt);

        if($scope.data.name.length>2){

            $scope.valid.name.className = '';
            $scope.valid.name.isValid = true;

        }else{

            $scope.valid.name.className = 'is-invalid';
            $scope.valid.name.isValid = false;

        }


    }



    $scope.checkClientEmail = function(){


        var wzorMaila = /^[0-9a-z_.-]+@[0-9a-z.-]+\.[a-z]{2,3}$/i


        if(wzorMaila.test($scope.data.clientemail)){


            $scope.valid.clientemail.className = '';
            $scope.valid.clientemail.isValid = true;

        }else{


            $scope.valid.clientemail.className = 'is-invalid';
            $scope.valid.clientemail.isValid = false;

        }

    }





    $scope.checkText = function(){

        //console.log($scope.values.txt);

        if($scope.data.message.length>3){

            $scope.valid.message.className= '';
            $scope.valid.message.isValid = true;

        }else{

            $scope.valid.message.className= 'is-invalid';
            $scope.valid.message.isValid = false;

        }


    }


    $scope.submitForm = function($event){

        $scope.checkName();
        $scope.checkClientEmail();
        $scope.checkText();


        if($filter('isValid')($scope.valid) && $scope.data.reg) {


            $scope.sendingraport = 'active';


            $http({
                method: 'POST',
                url: AppService.url+'/api/send/email',
                data: $scope.data,
                headers: {'Content-Type': 'application/json'}
            }).then(function (data, status, headers, config) {

                console.log(data.data);

                if(data.data==1){
                    $scope.sendingraport = '';
                    $scope.raport = 'active';
                    $scope.values={email:'', txt: ''};
                    $scope.valid={email: false, txt:false};
                }


            },function (data, status, headers, config) {
                //console.log(data);
            });


        }



    }



}]);



