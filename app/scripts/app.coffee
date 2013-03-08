# Put the URL pointing to the JSON containing your presentation here
# A good place to use is http://apibin.jonabrams.com/
window.PRESENTATION_URL = "https://apibin.jit.su/api/51390fa501bbc9a15500000f/angular-presentation"

angular.module('allAboutAngularApp', [])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        redirectTo: '/0'
      .when '/:id',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/0'
  ]
