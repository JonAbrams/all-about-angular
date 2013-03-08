'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach module 'allAboutAngularApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller) ->
    scope = {}
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'should provide 9 slides to the scope', () ->
    expect(scope.slides.length).toBe 9;
