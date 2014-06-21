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

ActiveRecord::Schema.define(version: 20140621010720) do

  create_table "bids", force: true do |t|
    t.integer "job_id"
    t.integer "freelancer_id"
    t.float   "amount"
    t.string  "status",        default: "Currently Active"
  end

  create_table "clients", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.string   "location"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "earnings", force: true do |t|
    t.integer  "freelancer_id"
    t.integer  "editor_id"
    t.integer  "job_id"
    t.integer  "client_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editors", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "phone"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.text     "bio"
    t.integer  "rating",     default: 0
    t.integer  "level",      default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "freelancers", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "email"
    t.string   "phone"
    t.text     "bio"
    t.integer  "rating",     default: 0
    t.integer  "level",      default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "client_id"
    t.integer  "freelancer_id"
    t.integer  "editor_id"
    t.string   "title"
    t.text     "description"
    t.string   "status",                     default: "Open"
    t.date     "due_date"
    t.integer  "tier_requested"
    t.integer  "word_count"
    t.float    "per_word_charge"
    t.float    "per_word_payment_to_writer"
    t.float    "per_word_payment_to_editor"
    t.float    "total_charge_to_client"
    t.float    "total_payment_to_writer"
    t.float    "total_payment_to_editor"
    t.integer  "writing_score"
    t.integer  "editing_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "freelancer_id"
    t.integer  "job_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "freelancer_id"
    t.integer  "editor_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.integer "job_id"
    t.integer "freelancer_id"
    t.integer "editor_id"
    t.string  "status",        default: "Not Started Yet"
    t.string  "link"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "user_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
