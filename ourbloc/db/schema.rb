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

ActiveRecord::Schema.define(version: 20161020193549) do

  create_table "asks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sector_id"
    t.text     "title"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sector_id"], name: "index_asks_on_sector_id"
    t.index ["user_id"], name: "index_asks_on_user_id"
  end

  create_table "influencers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sector_id"
    t.text     "title"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sector_id"], name: "index_jobs_on_sector_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sector_id"
    t.text     "title"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sector_id"], name: "index_resources_on_sector_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shares", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sector_id"
    t.text     "title"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sector_id"], name: "index_shares_on_sector_id"
    t.index ["user_id"], name: "index_shares_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "school"
    t.string   "major"
    t.integer  "gradyear"
    t.text     "experience"
    t.text     "bloc1"
    t.text     "bloc2"
    t.text     "bloc3"
    t.text     "skills"
    t.string   "orgs"
    t.string   "links"
    t.integer  "threeskills"
    t.string   "phone"
    t.text     "geo"
    t.string   "hometown"
    t.string   "company"
    t.text     "mission"
    t.text     "industry"
    t.string   "statement"
    t.string   "title"
    t.string   "resumelink"
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
