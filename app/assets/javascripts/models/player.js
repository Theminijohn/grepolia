var Player = Backbone.Model.extend({
	defaults: {
		grepo_id: '',
		name: '',
		alliance_id: '',
		points: '',
		rank: '',
		town_count: '',
		all_rank: '',
		all_points: '',
		def_rank: '',
		def_points: '',
		att_rank: '',
		att_points: ''
	},

  urlRoot: '/api/v1/players'

});

