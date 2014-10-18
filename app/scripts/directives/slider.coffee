'use strict'

###*
 # @ngdoc directive
 # @name lightsPleaseApp.directive:slider
 # @description
 # # slider
###
angular.module('lightsPleaseApp')
  .directive('slider', ($timeout)->
    template: '<canvas class="slider"></canvas>'
    restrict: 'E'
    scope: {
      ngModel : "="
      ngChange : "&"
      name : "="
    }
    link: ($scope, $element, $attributes, controller) ->
      canvas = $element.children()[0]
      ctx = canvas.getContext "2d"
      width = ctx.canvas.width = $(canvas).width()
      height = ctx.canvas.height = $(canvas).height()
      value = 0
      down = false
      name = "main"
      timeout = null

      $scope.$watch 'ngModel', (val) ->
        value = val
        draw()

      $scope.$watch 'name', (val) ->
        name = val
        draw()

      set = (val) ->
        if $scope.ngModel != undefined
          clearTimeout(timeout) if timeout
          set_smooth 0, value, val - value, 20

      set_smooth = (step, start, target, steps) ->
        value = smooth step, start, target, steps
        $scope.ngModel = Math.round(value)
        $timeout($scope.ngChange, 0)
        draw()
        if step != steps
          timeout = setTimeout(
            () ->
              set_smooth step+1, start, target, steps
          , 1000/60)

      smooth = (t, b, c, d) ->
        t /= d/2
        if t < 1
          return c/2*t*t + b
        t--
        return -c/2 * (t*(t-2) - 1) + b

      draw = ->
        ctx.fillStyle = "#000"
        ctx.fillRect 0, 0, width, height
        ctx.fillStyle = switch
          when name == "r" then "rgb(#{Math.round(value)},0,0)"
          when name == "g" then "rgb(0,#{Math.round(value)},0)"
          when name == "b" then "rgb(0,0,#{Math.round(value)})"
          else "rgb(#{Math.round(value)},#{Math.round(value)},#{Math.round(value)})"
        ctx.fillRect 0, 0, (value / 255 * width), height
      draw()

      $element.on "mousedown", (e) ->
        e.preventDefault()
        down = true
        set(e.offsetX / width * 255)

      $(document).on "mouseup", (e) ->
        down = false

      $element.on "mousemove", (e) ->
        e.preventDefault()
        return if not down
        set(e.offsetX / width * 255)

      $element.on "touchstart", (e) ->
        # console.log e
        e.preventDefault()
        set((e.originalEvent.touches[0].pageX - e.originalEvent.touches[0].target.offsetLeft) / width * 255)

  )
