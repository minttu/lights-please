'use strict'

###*
 # @ngdoc function
 # @name lightsPleaseApp.controller:MapCtrl
 # @description
 # # MapCtrl
 # Controller of the lightsPleaseApp
###
angular.module('lightsPleaseApp')
  .controller 'MapCtrl', ($scope, Data) ->
    $scope.groups = Data.groups

    $scope.$on "update", ->
      $scope.groups = Data.groups

    $scope.toggle = (group) ->
      Data.toggle group

    $scope.set = Data.set