(function () {
  var pinlessApp = angular.module('pinlessApp', ['ngRoute']);
  pinlessApp.value('currentUserId', window.currentUserId);

  pinlessApp.config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'pages/index.html',
        controller: 'FeedCtrl'
      })
      .when('/boards/:id', {
        templateUrl: 'pages/boards/show.html',
        controller: 'BoardShowCtrl'
      })
  });

  pinlessApp.controller('FeedCtrl', function ($scope, $http) {
    $http.get('/api/feed').success(function (data) {
      $scope.cards = data;
    });
  });

  pinlessApp.controller('BoardShowCtrl', function ($scope, $routeParams, $http) {
    var route = '/api/boards/' + $routeParams.id;
    $http.get(route).success(function (data) {
      $scope.board = data;
      $scope.cards = $scope.board.cards;
    });
  });
})();