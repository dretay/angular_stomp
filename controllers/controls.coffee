define [
    'c/controllers'
    'underscore'
    'jquery'
    'modals/AlarmModal'
    's/example'
  ],
(controllers, _, $) ->
  'use strict'

  controllers.controller 'controls', ['$scope', '$timeout', '$routeParams', 'example', '$modal', '$log'
    ($scope, $timeout, $routeParams, example,  $modal, $log) ->

      $log.debug "Controls::controller populating scope"
      $scope.activeFloor = $routeParams.floor
      $scope.example = example.query(null,{scope:$scope})


  ]
