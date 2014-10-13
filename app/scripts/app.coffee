'use strict'

###*
 # @ngdoc overview
 # @name lightsPleaseApp
 # @description
 # # lightsPleaseApp
 #
 # Main module of the application.
###
angular
  .module('lightsPleaseApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'btford.socket-io'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .when '/map',
        templateUrl: 'views/map.html'
        controller: 'MapCtrl'
      .otherwise
        redirectTo: '/'
