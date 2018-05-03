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

ActiveRecord::Schema.define(version: 20161012131101) do

  create_table "entries", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.string   "email",      limit: 255
    t.string   "name",       limit: 255
    t.string   "message",    limit: 255
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "title",         limit: 255
    t.date     "opendate"
    t.string   "opendate_memo", limit: 255
    t.string   "postal",        limit: 255
    t.string   "address",       limit: 255
    t.string   "address_embed", limit: 2000,     default: "", null: false
    t.integer  "fee",           limit: 4
    t.integer  "limit",         limit: 4
    t.string   "desc_short",    limit: 255
    t.text     "desc_long",     limit: 65535
    t.binary   "picture_main",  limit: 16777215
    t.binary   "picture_1",     limit: 16777215
    t.binary   "picture_2",     limit: 16777215
    t.binary   "picture_3",     limit: 16777215
    t.string   "url",           limit: 255
    t.string   "url_facebook",  limit: 255
    t.string   "url_twitter",   limit: 255
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_title", limit: 255
    t.string   "fee_memo",      limit: 255
    t.string   "host",          limit: 255,      default: "", null: false
    t.boolean  "has_entry"
    t.string   "address_memo",  limit: 255
    t.string   "address_url",   limit: 255
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.string   "short_desc", limit: 255
    t.text     "long_desc",  limit: 65535
    t.binary   "picture_1",  limit: 16777215
    t.binary   "picture_2",  limit: 16777215
    t.binary   "picture_3",  limit: 16777215
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,      default: "", null: false
    t.string   "encrypted_password",     limit: 255,      default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.binary   "picture",                limit: 16777215
    t.text     "desc",                   limit: 65535
    t.string   "url",                    limit: 255
    t.string   "id_facebook",            limit: 255
    t.string   "id_twitter",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
