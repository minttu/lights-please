'use strict'

###*
 # @ngdoc directive
 # @name lightsPleaseApp.directive:integer
 # @description
 # # integer
###
angular.module('lightsPleaseApp')
  .directive('integer', ->
    require: 'ngModel',
    link: (scope, ele, attr, ctrl) ->
      ctrl.$parsers.unshift (viewValue) ->
        return parseInt viewValue, 10
  )
