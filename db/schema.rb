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

ActiveRecord::Schema[7.2].define(version: 2024_09_17_010225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bossue_applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bossue_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bossue_id"], name: "index_bossue_applications_on_bossue_id"
    t.index ["user_id"], name: "index_bossue_applications_on_user_id"
  end

  create_table "bossues", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "content"
    t.integer "status", default: 0
    t.string "repository_id", null: false
    t.string "issue_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bossue_sentence"
    t.index ["user_id"], name: "index_bossues_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail_url"
  end

  add_foreign_key "bossue_applications", "bossues"
  add_foreign_key "bossue_applications", "users"
  add_foreign_key "bossues", "users"
end
