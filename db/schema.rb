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

ActiveRecord::Schema.define(version: 20160203213248) do

  create_table "Items", force: :cascade do |t|
    t.string   "title"
    t.string   "series"
    t.string   "speaker"
    t.text     "summary"
    t.string   "file_path"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_path"
    t.datetime "publication_date"
    t.string   "audio_file_file_name"
    t.string   "audio_file_content_type"
    t.integer  "audio_file_file_size"
    t.datetime "audio_file_updated_at"
    t.integer  "feed_id"
  end

  add_index "Items", ["feed_id"], name: "index_items_on_feed_id"

  create_table "feeds", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.string   "language"
    t.string   "copyright"
    t.string   "description"
    t.string   "logo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "author"
    t.text     "summary"
    t.string   "owner_name"
    t.string   "owner_mail"
    t.string   "category"
    t.string   "ftp_root_url"
    t.string   "ftp_path"
  end

end
