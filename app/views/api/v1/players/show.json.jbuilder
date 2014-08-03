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

json.(@player, :created_at, :updated_at)