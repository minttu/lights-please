'use strict'

describe 'Filter: tocolor', ->

  # load the filter's module
  beforeEach module 'lightsPleaseApp'

  # initialize a new instance of the filter before each test
  tocolor = {}
  beforeEach inject ($filter) ->
    tocolor = $filter 'tocolor'

  it 'should return the input prefixed with "tocolor filter:"', ->
    text = 'angularjs'
    expect(tocolor text).toBe ('tocolor filter: ' + text)
