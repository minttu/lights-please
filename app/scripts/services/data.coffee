'use strict'

###*
 # @ngdoc service
 # @name lightsPleaseApp.data
 # @description
 # # data
 # Service in the lightsPleaseApp.
###
angular.module('lightsPleaseApp')
  .service 'Data', (socketFactory, $rootScope) ->
    service =
      socket: new socketFactory()
      groups: {}
      presets: {}

    service.push = (data) ->
      service.socket.emit "update", data

    service.toggle = (group) ->
      service.socket.emit "toggle", {group: {name: group.name}}

    service.save = (name) ->
      service.socket.emit "save", {name: name}

    service.load = (preset) ->
      service.socket.emit "load", {name: preset.name}

    service.socket.on "connect", ->
      console.log "Connected!"

    service.socket.on "update", (data) ->
      service.groups = data.groups
      service.presets = data.presets
      $rootScope.$broadcast "update", data.groups

    return service