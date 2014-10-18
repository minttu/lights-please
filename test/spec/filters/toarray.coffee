'use strict'

describe 'Filter: toArray', ->

  # load the filter's module
  beforeEach module 'lightsPleaseApp'

  # initialize a new instance of the filter before each test
  toArray = {}
  beforeEach inject ($filter) ->
    toArray = $filter 'toArray'

  it 'should return the input prefixed with "toArray filter:"', ->
    text = 'angularjs'
    expect(toArray text).toBe ('toArray filter: ' + text)
