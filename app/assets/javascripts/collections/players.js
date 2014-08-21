Grepolia.Collections.Players = Backbone.Collection.extend({
	model: Grepolia.Models.Player,
  url: '#'
});

var players = new Grepolia.Collections.Players();
players.fetch();
