/*******************************
    initialize angularjs' module
*******************************/
'use strict'
angular.module('managerApp',['ngRoute']);

// %2F를 slash로 바꿔주는 서비스
angular.module('managerApp')
.config(['$locationProvider', function($locationProvider) {
    $locationProvider.hashPrefix('');
 }]);

angular.module('managerApp')
.config(function($routeProvider){
    $routeProvider
        .when("/home", {
            templateUrl: "content_home.tpl.html",
            controller: "HomeCtrl",
        })
        .when("/user", {
            templateUrl: "content_user.tpl.html",
            controller: "UserCtrl"
        })
        .when("/product", {
            templateUrl: "content_product.tpl.html",
            controller: "ProductCtrl"
        })
        .when("/board", {
            templateUrl: "content_board.tpl.html",
            controller: "BoardCtrl"
        })
        .when("/order", {
            templateUrl: "content_order.tpl.html",
            controller: "OrderCtrl"
        })
        .when("/page", {
            templateUrl: "content_page.tpl.html",
            controller: "PageCtrl"
        })
        .otherwise({
            template: "<p id='permissionDenined'>Permission denined</p>",
            controller: ""
        })
});
