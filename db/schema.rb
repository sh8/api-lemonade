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

ActiveRecord::Schema.define(version: 20150703062022) do

  create_table "average_prices", force: :cascade do |t|
    t.integer  "price",               limit: 4
    t.integer  "master_meal_time_id", limit: 4
    t.integer  "restaurant_id",       limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "business_days", force: :cascade do |t|
    t.integer  "day",           limit: 4, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "restaurant_id", limit: 4
  end

  create_table "business_hours", force: :cascade do |t|
    t.string   "start",           limit: 255, null: false
    t.string   "end",             limit: 255, null: false
    t.integer  "business_day_id", limit: 4,   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id",    limit: 4,     null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.text     "content",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "friend_ships", force: :cascade do |t|
    t.integer  "follow_user_id",   limit: 4,                 null: false
    t.integer  "followed_user_id", limit: 4,                 null: false
    t.boolean  "is_approved",      limit: 1, default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "post_id",    limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "master_genres", force: :cascade do |t|
    t.string "name",          limit: 255, null: false
    t.string "foursquare_id", limit: 255
  end

  create_table "master_meal_times", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "master_sns_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,   null: false
    t.string   "photo",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "restaurant_id", limit: 4
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",              limit: 255,                           null: false
    t.string   "ruby",              limit: 255
    t.decimal  "lat",                             precision: 9, scale: 6, null: false
    t.decimal  "lon",                             precision: 9, scale: 6, null: false
    t.integer  "master_genre_id",   limit: 4,                             null: false
    t.date     "registration_date"
    t.string   "address",           limit: 255
    t.string   "tel",               limit: 255
    t.text     "remarks",           limit: 65535
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "foursquare_id",     limit: 255
    t.string   "country",           limit: 255
    t.string   "city",              limit: 255
    t.string   "state",             limit: 255
    t.string   "cc",                limit: 255
  end

  add_index "restaurants", ["foursquare_id"], name: "index_restaurants_on_foursquare_id", using: :btree
  add_index "restaurants", ["lat"], name: "index_restaurants_on_lat", using: :btree
  add_index "restaurants", ["lon"], name: "index_restaurants_on_lon", using: :btree
  add_index "restaurants", ["name"], name: "index_restaurants_on_name", using: :btree

  create_table "user_sns_types", force: :cascade do |t|
    t.integer  "master_sns_type_id", limit: 4
    t.integer  "user_id",            limit: 4
    t.string   "access_token",       limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "user_valuations", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,              null: false
    t.integer  "restaurant_id",    limit: 4,              null: false
    t.integer  "purpose",          limit: 4,  default: 0
    t.integer  "price",            limit: 4,  default: 3
    t.integer  "quality",          limit: 4,  default: 3
    t.integer  "service",          limit: 4,  default: 3
    t.integer  "mood",             limit: 4,  default: 3
    t.integer  "cost_performance", limit: 4,  default: 3
    t.float    "total_score",      limit: 24,             null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255,             null: false
    t.string   "email",           limit: 255,             null: false
    t.string   "screen_name",     limit: 255,             null: false
    t.integer  "sex",             limit: 4,   default: 0, null: false
    t.date     "birthday"
    t.integer  "average_cost",    limit: 4
    t.integer  "role",            limit: 4,   default: 0
    t.integer  "status",          limit: 4,   default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "access_token",    limit: 255
    t.integer  "sns_type",        limit: 4
    t.string   "uid",             limit: 255
  end

end
