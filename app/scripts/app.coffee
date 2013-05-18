# Put the URL pointing to the JSON containing your presentation here
# A good place to use is http://apibin.jonabrams.com/
window.PRESENTATION_URL = "http://apibin.jonabrams.com/api/ebf2c6c/all-about-angular"

angular.module('allAboutAngularApp', [])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        redirectTo: '/1'
      .when '/:id',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/1'
  ]
