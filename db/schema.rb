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

ActiveRecord::Schema.define(version: 20160423181953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "procmodes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wait_time",  default: 10
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "settings", ["user_id"], name: "index_settings_on_user_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "screen_name"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "workorders", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "data_set"
    t.integer  "status_id"
    t.integer  "user_id"
    t.integer  "procmode_id", default: 0
    t.string   "obstime"
    t.integer  "alert_flag",  default: 0
  end

  add_index "workorders", ["procmode_id"], name: "index_workorders_on_procmode_id", using: :btree
  add_index "workorders", ["user_id"], name: "index_workorders_on_user_id", using: :btree

end
