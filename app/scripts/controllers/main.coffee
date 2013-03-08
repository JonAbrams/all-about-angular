# Taken from: http://stackoverflow.com/questions/18082/validate-numbers-in-javascript-isnumeric
isNumber = (n) ->
  not isNaN(parseFloat(n)) and isFinite(n)

keyCodes = {
  32: "space"
  37: "left"
  39: "right"
}

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
        if $scope.slideNum > $scope.slides.length
          $scope.open "1"
      else
        $http.get(PRESENTATION_URL)
        .then (result) ->
          $scope.slides = slideCache = result.data
          if $scope.slideNum > $scope.slides.length
            $scope.open "1"

      unless isNumber($scope.slideNum) and $scope.slideNum > 0
        $scope.open "1"

      $("body").off("keydown").on "keydown", (event) ->
        # $apply forces angular to update the view after the model may have
        # been changed
        $scope.$apply ->
          keyCode = keyCodes[event.keyCode]
          return unless keyCode
          if keyCode in ["space", "right"] and $scope.slideNum < $scope.slides.length
            $scope.open($scope.slideNum + 1)
          else if keyCode is "left" and $scope.slideNum > 1
            $scope.open($scope.slideNum - 1)
  ])


