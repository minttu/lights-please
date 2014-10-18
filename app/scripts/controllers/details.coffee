'use strict'

###*
 # @ngdoc function
 # @name lightsPleaseApp.controller:DetailsCtrl
 # @description
 # # DetailsCtrl
 # Controller of the lightsPleaseApp
###
angular.module('lightsPleaseApp')
  .controller 'DetailsCtrl', ($scope, Data) ->
    $scope.groups = Data.groups

    $scope.$on "update", ->
      $scope.groups = Data.groups

    $scope.toggle = (group) ->
      Data.toggle group

    $scope.set = Data.set

    #$scope.change = (group, light) ->
    #  Data.push {groups: [{name: group.name, lights: [light]}]}