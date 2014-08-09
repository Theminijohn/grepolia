json.id @player.grepo_id
json.name @player.name
json.alliance_id @player.alliance_id
json.points @player.points
json.rank @player.rank
json.town_count @player.town_count

json.bash_points do
  json.all_rank @player.all_rank
  json.all_points @player.all_points
  json.def_rank @player.def_rank
  json.def_points @player.def_points
  json.att_rank @player.att_rank
  json.att_points @player.att_points
end

json.towns do
  json.array! @player.towns do |t|
	  json.id t.grepo_id
	  json.player_id t.player_id
	  json.name t.name
	  json.island_x t.island_x
	  json.island_y t.island_y
	  json.slot t.slot
	  json.points t.points
	  json.(t, :created_at, :updated_at)
  end
end

json.conquers do
	json.array! @player.conquers do |c|
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
end



json.(@player, :created_at, :updated_at)