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

ActiveRecord::Schema.define(version: 20171218162801) do

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["user_id", "name"], name: "index_ahoy_events_on_user_id_and_name"
    t.index ["visit_id", "name"], name: "index_ahoy_events_on_visit_id_and_name"
  end

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

  create_table "experiences", force: :cascade do |t|
    t.string   "dates"
    t.string   "type"
    t.string   "detail1"
    t.string   "detail2"
    t.string   "detail3"
    t.string   "detail4"
    t.string   "title"
    t.string   "position"
    t.string   "location"
    t.integer  "resume_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "design"
    t.integer  "job_quality"
    t.integer  "ease"
    t.integer  "login"
  end

  create_table "influencers", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.text     "description"
    t.string   "industry"
    t.string   "style"
    t.string   "image"
    t.string   "school"
    t.string   "major"
    t.string   "experience"
    t.string   "extra"
    t.string   "grad"
    t.string   "grad_gradyear"
    t.string   "gradyear"
    t.string   "advice1"
    t.string   "advice2"
    t.string   "advice3"
    t.string   "advice4"
    t.string   "resources"
    t.integer  "visit_id"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_influencers_on_user_id"
  end

  create_table "iresumes", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.text     "description"
    t.string   "location"
    t.text     "bio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "title"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "saved"
    t.string   "industry"
    t.date     "deadline"
    t.string   "company"
    t.string   "link"
    t.string   "industry2"
    t.string   "industry3"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "page_views", force: :cascade do |t|
    t.string   "user_id"
    t.string   "referer"
    t.string   "session"
    t.string   "ip_address"
    t.string   "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sector_id"
    t.text     "title"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "resources"
    t.string   "industry"
    t.string   "company"
    t.string   "image"
    t.string   "upload"
    t.string   "link"
    t.string   "prep"
    t.string   "type"
    t.string   "job_type"
    t.string   "style"
    t.index ["sector_id"], name: "index_resources_on_sector_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "public"
    t.string   "school"
    t.string   "type"
    t.string   "languageskills"
    t.string   "computerskills"
    t.string   "activities"
    t.string   "interests"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.string   "phone"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.string   "school"
    t.string   "gradyear"
    t.string   "gradschool"
    t.string   "major"
    t.string   "style"
    t.string   "prep"
    t.string   "dreamjob"
    t.string   "breakout"
    t.string   "breakout2"
    t.string   "resume"
    t.string   "promo_code"
    t.string   "group"
    t.string   "access"
    t.string   "food"
    t.string   "pronouns"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "email"
    t.string   "name"
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "card_token"
    t.string   "role"
    t.string   "current_job"
    t.string   "company"
    t.string   "promotion"
    t.string   "promotion_link"
    t.string   "tip"
    t.string   "tip_link"
    t.string   "image"
    t.string   "linkedin"
    t.text     "bio"
    t.index ["event_id"], name: "index_rsvps_on_event_id"
    t.index ["user_id"], name: "index_rsvps_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "query"
    t.string   "category"
    t.string   "industry"
    t.integer  "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "prep"
    t.string   "grad"
    t.boolean  "for_email"
    t.string   "gradyear"
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "industry2"
    t.string   "industry3"
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: ""
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
    t.integer  "refererred_by_user_id"
    t.string   "profileurl"
    t.string   "referral_code"
    t.string   "gender"
    t.string   "picture"
    t.string   "timezone"
    t.string   "firstname"
    t.boolean  "premium"
    t.string   "career_services"
    t.string   "linkedin"
    t.string   "login_bypass_token"
    t.string   "industry2"
    t.string   "industry3"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.integer  "whoserve"
    t.integer  "howserve"
    t.string   "legacy"
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
    t.string   "style"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
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
    t.string   "school"
    t.string   "career_services"
    t.string   "linkedin"
    t.index ["user_id"], name: "index_visions_on_user_id"
  end

  create_table "visits", force: :cascade do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_visits_on_user_id"
    t.index ["visit_token"], name: "index_visits_on_visit_token", unique: true
  end

end
