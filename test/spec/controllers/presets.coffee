'use strict'

describe 'Controller: PresetsCtrl', ->

  # load the controller's module
  beforeEach module 'lightsPleaseApp'

  PresetsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PresetsCtrl = $controller 'PresetsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
