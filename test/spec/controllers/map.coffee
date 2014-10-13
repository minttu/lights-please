'use strict'

describe 'Controller: MapCtrl', ->

  # load the controller's module
  beforeEach module 'lightsPleaseApp'

  MapCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MapCtrl = $controller 'MapCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
