'use strict'

###*
 # @ngdoc function
 # @name lightsPleaseApp.controller:NavbarCtrl
 # @description
 # # NavbarCtrl
 # Controller of the lightsPleaseApp
###
angular.module('lightsPleaseApp')
  .controller 'NavbarCtrl', ($scope, $location) ->
    $scope.isActive = (viewLocation) ->
      return viewLocation == $location.path()
