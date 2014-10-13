'use strict'

describe 'Service: data', ->

  # load the service's module
  beforeEach module 'lightsPleaseApp'

  # instantiate service
  data = {}
  beforeEach inject (_data_) ->
    data = _data_

  it 'should do something', ->
    expect(!!data).toBe true
