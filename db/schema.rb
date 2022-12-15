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

ActiveRecord::Schema[7.0].define(version: 2022_12_15_154424) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admissions", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_admissions_on_league_id"
    t.index ["user_id"], name: "index_admissions_on_user_id"
  end

  create_table "bets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stage_id", null: false
    t.bigint "rider_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rider_id"], name: "index_bets_on_rider_id"
    t.index ["stage_id"], name: "index_bets_on_stage_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leagues_on_user_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.date "starting_date"
    t.date "ending_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "result_position"
    t.bigint "rider_id", null: false
    t.bigint "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rider_id"], name: "index_results_on_rider_id"
    t.index ["stage_id"], name: "index_results_on_stage_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "team"
    t.string "nationality"
    t.integer "bib"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "points", default: 0
    t.bigint "stage_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_scores_on_stage_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "stages", force: :cascade do |t|
    t.date "date"
    t.string "stage_type"
    t.float "length"
    t.integer "number"
    t.string "departure"
    t.string "arrival"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "race_id", null: false
    t.index ["race_id"], name: "index_stages_on_race_id"
  end

  create_table "total_scores", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "yellow_jersey", default: 0
    t.integer "green_jersey", default: 0
    t.integer "polka_dot_jersey", default: 0
    t.index ["race_id"], name: "index_total_scores_on_race_id"
    t.index ["user_id"], name: "index_total_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "avatar"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admissions", "leagues"
  add_foreign_key "admissions", "users"
  add_foreign_key "bets", "riders"
  add_foreign_key "bets", "stages"
  add_foreign_key "bets", "users"
  add_foreign_key "leagues", "users"
  add_foreign_key "results", "riders"
  add_foreign_key "results", "stages"
  add_foreign_key "scores", "stages"
  add_foreign_key "scores", "users"
  add_foreign_key "stages", "races"
  add_foreign_key "total_scores", "races"
  add_foreign_key "total_scores", "users"
end
