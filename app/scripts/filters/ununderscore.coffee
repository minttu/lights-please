'use strict'

###*
 # @ngdoc filter
 # @name lightsPleaseApp.filter:ununderscore
 # @function
 # @description
 # # ununderscore
 # Filter in the lightsPleaseApp.
###
angular.module('lightsPleaseApp')
  .filter 'unUnderscore', ->
    (input) ->
      return input.replace(/_/g, " ")
