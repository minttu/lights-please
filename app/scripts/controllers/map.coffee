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

    $scope.toggle = (group, light) ->
      totrue = false
      for channel_name of light.channels
        channel = light.channels[channel_name]
        if channel.value == 0
          totrue = true
      for channel_name of light.channels
        channel = light.channels[channel_name]
        channel.value = 255 * totrue
      Data.push {groups: [{name: group.name, lights: [light]}]}
      for channel_name of light.channels
        channel = light.channels[channel_name]
        channel.value = channel.old
