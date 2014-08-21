Grepolia.Routers.Players = Backbone.Router.extend({
	routes: {
		'players': 'index',
		'players/:id': 'show'
	},

	index: function() {
		console.log('You are in Index'); 
		},

	show: function(id) {
    //window.player = new Grepolia.Models.Player({id: id});
    var player = new Player({id: id});
		player.fetch();
		console.log('You are in Show');
	}
});
