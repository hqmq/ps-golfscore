window.RecentGames = function($scope, $http) {
  $http.get('/recent_games.json').success(function(data) {
    $scope.recent_games = data;
  });
};
