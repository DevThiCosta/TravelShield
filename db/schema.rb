# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_19_035412) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "district"
    t.string "country"
    t.string "state"
    t.string "safety_tip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
  end

  create_table "danger_areas", force: :cascade do |t|
    t.integer "risk"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.bigint "city_id"
    t.bigint "user_id"
    t.string "name"
    t.string "icon"
    t.index ["city_id"], name: "index_danger_areas_on_city_id"
    t.index ["user_id"], name: "index_danger_areas_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "title"
    t.integer "rate"
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_reviews_on_city_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "saved_cities_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_saved_cities_users_on_city_id"
    t.index ["user_id", "city_id"], name: "index_saved_cities_users_on_user_id_and_city_id", unique: true
    t.index ["user_id"], name: "index_saved_cities_users_on_user_id"
  end

  create_table "sights", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "price"
    t.float "rate"
    t.string "photo"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.date "birthday"
    t.string "avatar"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "danger_areas", "cities"
  add_foreign_key "danger_areas", "users"
  add_foreign_key "reviews", "cities"
  add_foreign_key "reviews", "users"
end
