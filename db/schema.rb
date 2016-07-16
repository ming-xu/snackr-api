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

ActiveRecord::Schema.define(version: 20160716201535) do

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.boolean "special"
    t.string  "singular_name"
    t.string  "icon"
  end

  create_table "item_comments", force: :cascade do |t|
    t.integer "item_id"
    t.text    "comment"
  end

  create_table "item_votes", force: :cascade do |t|
    t.integer "item_id"
    t.integer "vote_count"
  end

  create_table "items", force: :cascade do |t|
    t.integer "category_id"
    t.string  "name"
    t.text    "description"
    t.binary  "picture"
    t.boolean "status",           default: false
    t.integer "item_up_votes",    default: 0
    t.integer "item_down_votes",  default: 0
    t.integer "item_total_votes", default: 0
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id"
    t.date    "date"
    t.integer "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string  "order_type"
    t.string  "name"
    t.decimal "price"
    t.date    "date"
  end

  create_table "user_votes", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "number_of_up_votes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "number_of_down_votes"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "role"
    t.integer "number_of_down_votes"
    t.integer "number_of_up_votes"
  end

end
