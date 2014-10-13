'use strict'

describe 'Filter: ununderscore', ->

  # load the filter's module
  beforeEach module 'lightsPleaseApp'

  # initialize a new instance of the filter before each test
  ununderscore = {}
  beforeEach inject ($filter) ->
    ununderscore = $filter 'ununderscore'

  it 'should return the input prefixed with "ununderscore filter:"', ->
    text = 'angularjs'
    expect(ununderscore text).toBe ('ununderscore filter: ' + text)
