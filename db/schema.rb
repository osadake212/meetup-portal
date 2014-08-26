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

ActiveRecord::Schema.define(version: 20140824235959) do

  create_table "attendances", force: true do |t|
    t.integer  "user_id"
    t.integer  "meetup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["meetup_id"], name: "index_attendances_on_meetup_id"
  add_index "attendances", ["user_id", "meetup_id"], name: "index_attendances_on_user_id_and_meetup_id", unique: true
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id"

  create_table "meetups", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "short_description"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetups", ["end_date"], name: "index_meetups_on_end_date"
  add_index "meetups", ["short_description"], name: "index_meetups_on_short_description"
  add_index "meetups", ["start_date"], name: "index_meetups_on_start_date"
  add_index "meetups", ["title"], name: "index_meetups_on_title"

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["content"], name: "index_microposts_on_content"
  add_index "microposts", ["user_id", "content"], name: "index_microposts_on_user_id_and_content"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
