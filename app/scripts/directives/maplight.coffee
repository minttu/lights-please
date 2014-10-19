'use strict'

###*
 # @ngdoc directive
 # @name lightsPleaseApp.directive:mapLight
 # @description
 # # mapLight
###
angular.module('lightsPleaseApp')
  .directive('mapLight', ($rootScope, Data) ->
    template: ''
    restrict: 'E'
    scope: {
      position: "="
      channels: "="
      type: "="
      name: "="
    }
    link: ($scope, $element, $attrs) ->

      $element.on "click", ->
        $scope.channels = Data.purkkatoggle $scope.name
        update_color $scope.channels

      $element.on "touchstart", (e) ->
        e.preventDefault()
        $scope.channels = Data.purkkatoggle $scope.name
        update_color $scope.channels

      $rootScope.$on "update", (event, data) ->
        data = data[0]
        if data.lights?
          for light in data.lights
            if light.name == $scope.name
              $scope.channels = light.channels

      $scope.$watch 'type', (type) ->
        if type != null
          $element.addClass "light-" + type

      $scope.$watch 'position', (position) ->
        if position != null
          $element.css "top", "calc(" + position.y + "% - 1.25vw)"
          $element.css "left", "calc(" + position.x + "% - 1.25vw)"

          if $scope.type != null
            type = $scope.type
            if type == "strip"
              $element.css "top", "calc(" + position.y + "% - 3.75vw)"
            if type == "rgb_strip"
              $element.css "left", "calc(" + position.x + "% - 3.75vw)"

      update_color = (channels) ->
        if channels.main?
          color = channels.main.value
          $element.css "background-color", "rgb(#{color},#{color},#{color})"
        else
          r = channels.r.value
          g = channels.g.value
          b = channels.b.value
          $element.css "background-color", "rgb(#{r},#{g},#{b})"

      $scope.$watch 'channels', (channels) ->
        update_color channels

  )
