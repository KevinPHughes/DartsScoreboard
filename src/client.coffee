angular = require('angular')

window.darts = angular.module('darts', [])
  .controller('MainController', require('./mainController.coffee'))
  .controller('CountdownController', require('./countdownController.coffee'))
  .service('service', require('./service.coffee'))