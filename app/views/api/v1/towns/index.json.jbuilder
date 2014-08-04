json.array! @towns do |town|

  json.id town.grepo_id
  json.player_id town.player_id
  json.name town.name
  json.island_x town.island_x
  json.island_y town.island_y
  json.slot town.slot
  json.points town.points

  json.(town, :created_at, :updated_at)

end
