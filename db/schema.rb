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

ActiveRecord::Schema.define(version: 2018_09_10_114241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "game_year"
    t.string "full_date"
    t.string "day"
    t.string "day_of_week"
    t.string "month"
    t.string "home_team"
    t.string "away_team"
    t.string "park"
    t.integer "home_homeruns"
    t.integer "away_homeruns"
    t.integer "home_score"
    t.integer "away_score"
    t.string "winner"
    t.string "loser"
    t.integer "total_homeruns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "season_id"
  end

  create_table "games_teams", id: false, force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "game_id", null: false
    t.index ["game_id"], name: "index_games_teams_on_game_id"
    t.index ["team_id"], name: "index_games_teams_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
  end

  create_table "teams", force: :cascade do |t|
    t.string "league"
    t.string "city"
    t.string "park"
    t.string "sheet_key"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "timestamps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
