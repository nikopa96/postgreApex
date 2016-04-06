'use strict';
(function (window) {
  var angular = window.angular;
  var module = angular.module('pgApexApp');

  function TemplateService(apiService) {
    this.apiService = apiService;
  }

  TemplateService.prototype.getTemplates = function (themeId) {
    return this.apiService.get('api/template/templates.json', {"themeId" : themeId});
  };

  TemplateService.prototype.getThemes = function (applicationId) {
    return this.apiService.get('api/template/themes.json', {"applicationId": applicationId});
  };

  function init() {
    module.service('templateService', ['apiService', TemplateService]);
  }

  init();
})(window);