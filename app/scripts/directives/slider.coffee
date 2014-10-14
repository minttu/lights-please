'use strict'

###*
 # @ngdoc directive
 # @name lightsPleaseApp.directive:slider
 # @description
 # # slider
###
angular.module('lightsPleaseApp')
  .directive('slider', ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the slider directive'
  )
