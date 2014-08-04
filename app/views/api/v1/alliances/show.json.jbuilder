  json.grepo_id @alliance.grepo_id
  json.name @alliance.name
  json.points @alliance.points
  json.town_count @alliance.town_count
  json.member_count @alliance.member_count
  json.rank @alliance.rank

  json.bash_points do
    json.all_rank @alliance.all_rank
    json.all_points @alliance.all_points
    json.def_rank @alliance.def_rank
    json.def_points @alliance.def_points
    json.att_rank @alliance.att_rank
    json.att_points @alliance.att_points
  end

  json.(@alliance, :created_at, :updated_at)