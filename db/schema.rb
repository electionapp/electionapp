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

ActiveRecord::Schema.define(version: 20161128055925) do

  create_table "candidates", force: :cascade do |t|
    t.integer  "position_id", null: false
    t.string   "name"
    t.text     "biography"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["position_id"], name: "index_candidates_on_position_id"
  end

  create_table "elections", force: :cascade do |t|
    t.text     "description"
    t.datetime "start_date"
    t.datetime "close_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "title"
  end

  create_table "elections_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "election_id"
    t.index ["user_id", "election_id"], name: "index_elections_users_on_user_id_and_election_id"
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "election_id", null: false
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["election_id"], name: "index_positions_on_election_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "election_id",  null: false
    t.integer  "candidate_id", null: false
    t.integer  "position_id",  null: false
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["candidate_id"], name: "index_votes_on_candidate_id"
    t.index ["election_id"], name: "index_votes_on_election_id"
    t.index ["position_id"], name: "index_votes_on_position_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
