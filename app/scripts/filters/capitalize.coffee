'use strict'

###*
 # @ngdoc filter
 # @name lightsPleaseApp.filter:capitalize
 # @function
 # @description
 # # capitalize
 # Filter in the lightsPleaseApp.
###
angular.module('lightsPleaseApp')
  .filter 'capitalize', ->
    (input) ->
      return input.charAt(0).toUpperCase() + input.substr(1).toLowerCase()
