window.AwesomePlayers = function($scope, $http) {
  $http.get('/awesome_players.json').success(function(data) {
    $scope.awesome_players = data;
  });
};
