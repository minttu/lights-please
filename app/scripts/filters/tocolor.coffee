'use strict'

###*
 # @ngdoc filter
 # @name lightsPleaseApp.filter:tocolor
 # @function
 # @description
 # # tocolor
 # Filter in the lightsPleaseApp.
###
angular.module('lightsPleaseApp')
  .filter 'tocolor', ->
    (input) ->
      if input.main?
        val = input.main.value
        return "rgb(#{val},#{val},#{val})"
      else
        return "rgb(#{input.r.value},#{input.g.value},#{input.b.value})"
