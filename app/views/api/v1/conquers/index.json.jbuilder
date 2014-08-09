json.array! @conquers do |c|

	json.town_id c.town_id
	json.time c.time
	json.new_player_id c.new_player_id
	json.old_player_id c.old_player_id
	json.new_ally_id c.new_ally_id
	json.old_ally_id c.old_ally_id
	json.town_points c.town_points
	json.intern c.intern
	json.old_player_name c.old_player_name
	json.old_alliance_name c.old_alliance_name

	json.(c, :created_at, :updated_at)

end