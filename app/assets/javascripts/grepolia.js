window.Grepolia = new Backbone.Marionette.Application();

_.extend(Grepolia, {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
})

Grepolia.addInitializer(function(){
  new Grepolia.Routers.Home();
  new Grepolia.Routers.Players();
})

Grepolia.on('start', function(options) {
  Backbone.history.start({pushState: true});
});

$(document).ready(function(){
  Grepolia.start();
});
