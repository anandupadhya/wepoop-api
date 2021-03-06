# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_01_112810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentication_tokens", force: :cascade do |t|
    t.string "body"
    t.bigint "user_id", null: false
    t.datetime "last_used_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ip_address"
    t.string "user_agent"
    t.index ["user_id"], name: "index_authentication_tokens_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "toilet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["toilet_id"], name: "index_favorites_on_toilet_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "toilet_id", null: false
    t.boolean "happy"
    t.string "status"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["toilet_id"], name: "index_reviews_on_toilet_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "toilets", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.boolean "accessibility"
    t.boolean "changing_station"
    t.text "directions"
    t.boolean "male"
    t.boolean "female"
    t.boolean "approved"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_toilets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "open_id"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authentication_tokens", "users"
  add_foreign_key "favorites", "toilets"
  add_foreign_key "favorites", "users"
  add_foreign_key "reviews", "toilets"
  add_foreign_key "reviews", "users"
  add_foreign_key "toilets", "users"
end
