'use strict'

describe 'Controller: DetailsCtrl', ->

  # load the controller's module
  beforeEach module 'lightsPleaseApp'

  DetailsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DetailsCtrl = $controller 'DetailsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
