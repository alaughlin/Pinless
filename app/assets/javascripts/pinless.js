(function () {
  var pinlessApp = angular.module('pinlessApp', ['ngRoute']);

  pinlessApp.config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'pages/index.html'
      })  
  });
})();