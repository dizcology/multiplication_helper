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

ActiveRecord::Schema.define(version: 20140903022106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id"
    t.string   "response"
    t.string   "event_type"
    t.string   "par"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.string   "answer"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "trait_id",   null: false
    t.integer  "event_id",   null: false
    t.boolean  "result",     null: false
    t.float    "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "traits", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_traits", force: true do |t|
    t.integer  "user_id",                  null: false
    t.integer  "trait_id",                 null: false
    t.integer  "n",          default: 0
    t.float    "value",      default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
