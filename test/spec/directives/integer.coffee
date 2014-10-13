'use strict'

describe 'Directive: integer', ->

  # load the directive's module
  beforeEach module 'lightsPleaseApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<integer></integer>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the integer directive'
