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

ActiveRecord::Schema.define(version: 0) do

  create_table "artists", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "checkins", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "artist_id",  limit: 4
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.float    "distance",   limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkins", ["artist_id"], name: "checkins_artist_index", using: :btree
  add_index "checkins", ["user_id"], name: "checkins_user_index", using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer  "artist_id",   limit: 4
    t.string   "name",        limit: 255
    t.string   "event_title", limit: 255
    t.string   "event_url",   limit: 255
    t.datetime "in_there_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
  end

  add_index "positions", ["artist_id"], name: "positions_artist_index", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.string   "nickname",   limit: 255
    t.string   "image_url",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
