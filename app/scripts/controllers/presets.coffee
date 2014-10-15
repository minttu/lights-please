'use strict'

###*
 # @ngdoc function
 # @name lightsPleaseApp.controller:PresetsCtrl
 # @description
 # # PresetsCtrl
 # Controller of the lightsPleaseApp
###
angular.module('lightsPleaseApp')
  .controller 'PresetsCtrl', ($scope, Data) ->
    $scope.presets = Data.presets

    $scope.$on "update", ->
      $scope.presets = Data.presets

    $scope.save = () ->
      if $scope.name
        Data.save $scope.name
        $scope.name = ""

    $scope.load = (preset) ->
      Data.load preset
      $scope.name = preset.name
