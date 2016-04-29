define [
    'angular'
    's/services'
    'r/WebStompResource'
  ],
(angular, services) ->
  'use strict'

  services.factory 'example', ['webStompResource', (Resource)->
    new Resource
      get:
        outbound_rpc: "/exchange/example.cmd"
        subscription: "/exchange/example.status/fanout"
        outboundTransform: (rawData)->
          operation: 'example_cmd'
        inboundTransform: (rawData, oldData)->
          #some transformation()
          return rawData

      update:
        inbound: "example.subtopic"
        outbound: "/exchange/example.cmd"
        outboundTransform: (query={}, oldEntity)->
          #some transformation()
          return oldEntity
  ]