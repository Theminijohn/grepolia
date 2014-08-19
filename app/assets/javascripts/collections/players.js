Grepolia.Collections.Players = Backbone.Collection.extend({
	model: Grepolia.Models.Player
  //url: '/api/v1/players',
});

var players = new Grepolia.Collections.Players();
players.fetch();
