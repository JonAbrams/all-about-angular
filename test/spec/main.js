(function() {
  'use strict';

  describe('Controller: MainCtrl', function() {
    var MainCtrl, scope;
    beforeEach(module('allAboutAngularApp'));
    MainCtrl = {};
    scope = {};
    beforeEach(inject(function($controller) {
      scope = {};
      return MainCtrl = $controller('MainCtrl', {
        $scope: scope
      });
    }));
    return it('should provide 9 slides to the scope', function() {
      return expect(scope.slides.length).toBe(9);
    });
  });

}).call(this);
