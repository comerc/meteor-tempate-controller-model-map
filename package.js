Package.describe({
  name: 'comerc:tempate-controller-model-map',
  version: '1.0.0',
  summary: 'Get Valid Data for Model by TemplateController!',
  git: 'https://github.com/comerc/meteor-tempate-controller-model-map',
  documentation: 'README.md'
});

Package.onUse(function (api) {
  // Have to stay on Meteor 1.2.1 to be compatible with all Meteor versions.
  api.versionsFrom('1.2.1');
  api.use([
    'coffeescript'
  ]);
  api.addFiles('tempate-controller-model-map.coffee', 'client');
  api.export('TemplateControllerModelMap');
});
