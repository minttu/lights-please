'use strict'

###*
 # @ngdoc function
 # @name lightsPleaseApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the lightsPleaseApp
###
angular.module('lightsPleaseApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
