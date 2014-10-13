'use strict'

###*
 # @ngdoc function
 # @name lightsPleaseApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the lightsPleaseApp
###
angular.module('lightsPleaseApp')
  .controller 'MainCtrl', ($scope, Data) ->
    $scope.groups = Data.groups

    $scope.$on "update", ->
      $scope.groups = Data.groups

    $scope.change = (group, light) ->
      Data.push {groups: [{name: group.name, lights: [light]}]}
      """for ilight in group.lights
        if ilight.name == light.name
          for channel in ilight
            channel.value = channel.old
      return false"""