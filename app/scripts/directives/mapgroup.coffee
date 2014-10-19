'use strict'

###*
 # @ngdoc directive
 # @name lightsPleaseApp.directive:mapGroup
 # @description
 # # mapGroup
###
angular.module('lightsPleaseApp')
  .directive('mapGroup', ->
    template: '{{name}}<map-light ng-repeat="light in lights"
                                  channels="light.channels"
                                  position="light.position"
                                  name="light.name"
                                  type="light.type"></map-light>'
    restrict: 'E'
    scope: {
      name: "="
      position: "="
      lights: "="
    }
    link: ($scope, $element, $attrs) ->

      $scope.$watch 'position', (position) ->
        if position != undefined
          $element.css "top", position.y + "%"
          $element.css "left", position.x + "%"
          $element.css "height", position.h + "%"
          $element.css "width", position.w + "%"

  )
