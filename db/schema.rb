# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140804151332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alliances", primary_key: "grepo_id", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.integer  "town_count"
    t.integer  "member_count"
    t.integer  "rank"
    t.integer  "all_rank"
    t.integer  "all_points"
    t.integer  "def_rank"
    t.integer  "def_points"
    t.integer  "att_rank"
    t.integer  "att_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alliances", ["all_rank"], name: "index_alliances_on_all_rank", using: :btree
  add_index "alliances", ["att_points"], name: "index_alliances_on_att_points", using: :btree
  add_index "alliances", ["att_rank"], name: "index_alliances_on_att_rank", using: :btree
  add_index "alliances", ["def_points"], name: "index_alliances_on_def_points", using: :btree
  add_index "alliances", ["def_rank"], name: "index_alliances_on_def_rank", using: :btree
  add_index "alliances", ["grepo_id"], name: "index_alliances_on_grepo_id", using: :btree
  add_index "alliances", ["member_count"], name: "index_alliances_on_member_count", using: :btree
  add_index "alliances", ["name"], name: "index_alliances_on_name", using: :btree
  add_index "alliances", ["points"], name: "index_alliances_on_points", using: :btree
  add_index "alliances", ["rank"], name: "index_alliances_on_rank", using: :btree
  add_index "alliances", ["town_count"], name: "index_alliances_on_town_count", using: :btree

  create_table "players", primary_key: "grepo_id", force: true do |t|
    t.string   "name"
    t.integer  "alliance_id"
    t.integer  "points"
    t.integer  "rank"
    t.integer  "town_count"
    t.integer  "all_rank"
    t.integer  "all_points"
    t.integer  "def_rank"
    t.integer  "def_points"
    t.integer  "att_rank"
    t.integer  "att_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["all_points"], name: "index_players_on_all_points", using: :btree
  add_index "players", ["all_rank"], name: "index_players_on_all_rank", using: :btree
  add_index "players", ["alliance_id"], name: "index_players_on_alliance_id", using: :btree
  add_index "players", ["att_points"], name: "index_players_on_att_points", using: :btree
  add_index "players", ["att_rank"], name: "index_players_on_att_rank", using: :btree
  add_index "players", ["def_points"], name: "index_players_on_def_points", using: :btree
  add_index "players", ["def_rank"], name: "index_players_on_def_rank", using: :btree
  add_index "players", ["grepo_id"], name: "index_players_on_grepo_id", using: :btree
  add_index "players", ["name"], name: "index_players_on_name", using: :btree
  add_index "players", ["points"], name: "index_players_on_points", using: :btree
  add_index "players", ["rank"], name: "index_players_on_rank", using: :btree
  add_index "players", ["town_count"], name: "index_players_on_town_count", using: :btree

  create_table "towns", primary_key: "grepo_id", force: true do |t|
    t.integer  "player_id"
    t.string   "name"
    t.integer  "island_x"
    t.integer  "island_y"
    t.integer  "slot"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "towns", ["grepo_id"], name: "index_towns_on_grepo_id", using: :btree
  add_index "towns", ["island_x"], name: "index_towns_on_island_x", using: :btree
  add_index "towns", ["island_y"], name: "index_towns_on_island_y", using: :btree
  add_index "towns", ["player_id"], name: "index_towns_on_player_id", using: :btree
  add_index "towns", ["points"], name: "index_towns_on_points", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
