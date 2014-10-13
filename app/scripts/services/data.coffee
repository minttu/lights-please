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
    service.push = (data) ->
      service.socket.emit "update", data
    service.socket.on "connect", ->
      console.log "Connected!"
    service.socket.on "update", (data) ->
      service.groups = data.groups
      $rootScope.$broadcast "update", data.groups
    return service