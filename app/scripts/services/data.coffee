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
      group.active = !group.active
      for light in group.lights
        for channel_name of light.channels
          light.channels[channel_name].value = 255 * group.active
      service.socket.emit "update", {groups: [group]}


    # &*$# webdeveloping
    service.purkkatoggle = (light_name) ->
      for group in service.groups
        for light in group.lights
          if light.name == light_name
            active = false
            for channel_name of light.channels
              if light.channels[channel_name].value < 10
                active = true
            for channel_name of light.channels
              light.channels[channel_name].value = 255 * active
              service.set group, light
            return light.channels

    service.set = (group, light) ->
      group.active = false
      for in_light in group.lights
        for c_name of in_light.channels
          if in_light.channels[c_name].value > 10
            group.active = true
      service.socket.emit "update", {groups: [{name: group.name, active: group.active, lights: [light]}]}

    service.save = (name) ->
      service.socket.emit "save", {name: name}

    service.load = (preset) ->
      service.socket.emit "load", {name: preset.name}

    service.socket.on "connect", ->
      console.log "Connected!"

    service.socket.on "full_update", (data) ->
      console.log "full_update"
      service.groups = data.groups
      service.presets = data.presets
      $rootScope.$broadcast "update", data.groups

    service.socket.on "update", (data) ->
      console.log "update"
      #service.groups = data.groups if data.groups?
      service.presets = data.presets if data.presets?

      for d_group in data.groups
        for i_group in service.groups
          if d_group.name == i_group.name
            i_group.active = d_group.active if d_group.active?
            for d_light in d_group.lights
              for i_light in i_group.lights
                if d_light.name == i_light.name
                  for d_channel_name of d_light.channels
                    i_light.channels[d_channel_name].value = d_light.channels[d_channel_name].value

      $rootScope.$broadcast "update", data.groups

    return service