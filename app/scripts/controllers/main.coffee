# Taken from: http://stackoverflow.com/questions/18082/validate-numbers-in-javascript-isnumeric
isNumber = (n) ->
  not isNaN(parseFloat(n)) and isFinite(n)

slideCache = []

angular.module('allAboutAngularApp')
  .controller('MainCtrl', [
    "$scope", "$routeParams", "$location", "$http"
    ($scope, $routeParams, $location, $http) ->
      $scope.slideNum = parseInt $routeParams.id, 10

      $scope.open = (path) ->
        $location.path "/#{path}"

      if slideCache.length > 0
        $scope.slides = slideCache
      else
        $http.get(PRESENTATION_URL)
        .then (result) ->
          $scope.slides = slideCache = result.data
          if $scope.slideNum >= $scope.slides.length
            $scope.open "0"

      unless isNumber($scope.slideNum)
        $scope.open "0"
  ])


