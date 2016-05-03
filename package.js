Package.describe({
  name: 'comerc:template-controller-model-map',
  version: '1.0.2',
  summary: 'Get Valid Data for Model by TemplateController!',
  git: 'https://github.com/comerc/meteor-template-controller-model-map',
  documentation: 'README.md'
});

Package.onUse(function (api) {
  // Have to stay on Meteor 1.2.1 to be compatible with all Meteor versions.
  api.versionsFrom('1.2.1');
  api.use([
    'coffeescript'
  ]);
  api.addFiles('template-controller-model-map.coffee', 'client');
  api.export('TemplateControllerModelMap');
});
