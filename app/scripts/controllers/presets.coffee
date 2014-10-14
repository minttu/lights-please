'use strict'

###*
 # @ngdoc function
 # @name lightsPleaseApp.controller:PresetsCtrl
 # @description
 # # PresetsCtrl
 # Controller of the lightsPleaseApp
###
angular.module('lightsPleaseApp')
  .controller 'PresetsCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
