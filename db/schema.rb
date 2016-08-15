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

ActiveRecord::Schema.define(version: 20160815035629) do

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.boolean  "selected",   default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "practice_sessions", force: :cascade do |t|
    t.integer  "repertoire_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "repertoires", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "key"
    t.string   "quality"
    t.integer  "comfort"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "repertoire_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.string   "song_title"
    t.string   "key"
    t.string   "instrument_name"
    t.integer  "practice_session_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "song_id"
  end

  add_index "suggestions", ["practice_session_id"], name: "index_suggestions_on_practice_session_id"

end
