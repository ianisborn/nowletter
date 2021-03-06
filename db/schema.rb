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

ActiveRecord::Schema.define(version: 20160116232409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newsletters", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug"
    t.integer  "send_count", default: 0
  end

  add_index "newsletters", ["user_id"], name: "index_newsletters_on_user_id", using: :btree

  create_table "param_messages", force: :cascade do |t|
    t.string "body"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "newsletter_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "body"
    t.datetime "sent_at"
  end

  add_index "posts", ["newsletter_id"], name: "index_posts_on_newsletter_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "newsletter_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "subscriptions", ["newsletter_id"], name: "index_subscriptions_on_newsletter_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
