'use strict'

###*
 # @ngdoc filter
 # @name lightsPleaseApp.filter:toArray
 # @function
 # @description
 # # toArray
 # Filter in the lightsPleaseApp.
###
angular.module('lightsPleaseApp')
  .filter 'toArray', ->
    (input) ->
      arr = []
      for key of input
        obj = input[key]
        obj.key = key
        arr.push obj
      return arr
