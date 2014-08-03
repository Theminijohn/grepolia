window.Grepolia = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		new Grepolia.Routers.Players();
		Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
  Grepolia.initialize();
});
