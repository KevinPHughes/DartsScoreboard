angular = require('angular')
ngRoute = require('angular-route')

window.darts = angular.module('darts', ['ngRoute'])
  .controller('baseController', require('./baseController.coffee'))
  .controller('cricketController', require('./cricketController.coffee'))
  .controller('301Controller', require('./301Controller.coffee'))
  .service('service', require('./service.coffee'))
  .config [
    '$routeProvider'
    ($routeProvider) ->
      $routeProvider.when('/301',
        templateUrl: 'partials/301.html'
        controller: '301Controller')
      .when('/cricket',
        templateUrl: 'partials/cricket.html'
        controller: 'cricketController')
      .otherwise redirectTo: '/cricket'
  ]