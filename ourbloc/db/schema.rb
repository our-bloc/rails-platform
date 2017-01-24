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

ActiveRecord::Schema.define(version: 20170121035755) do

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

  create_table "events", force: :cascade do |t|
    t.string   "org"
    t.date     "date"
    t.string   "user_id"
    t.string   "contact"
    t.string   "industry"
    t.text     "body"
    t.string   "social"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "influencers", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
    t.string   "industry"
    t.string   "style"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sector_id"
    t.text     "title"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "saved"
    t.integer  "prep"
    t.string   "industry"
    t.date     "deadline"
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

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "industry"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "firstjob"
    t.string   "prep"
    t.string   "style"
    t.string   "gradschool"
    t.string   "office"
    t.string   "companies"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.text     "whoserve"
    t.text     "howserve"
    t.text     "legacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "moves"
    t.integer  "drama"
    t.integer  "office"
    t.index ["user_id"], name: "index_values_on_user_id"
  end

  create_table "visions", force: :cascade do |t|
    t.string   "industry"
    t.string   "ten"
    t.string   "dreamjob"
    t.text     "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "mentor"
    t.string   "gradschool"
    t.string   "prep"
    t.string   "firstjob"
    t.string   "companies"
    t.string   "username"
    t.string   "email"
    t.string   "image"
    t.string   "gender"
    t.string   "timezone"
    t.string   "age"
    t.string   "major"
    t.integer  "gradyear"
    t.index ["user_id"], name: "index_visions_on_user_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
