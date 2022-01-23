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

ActiveRecord::Schema.define(version: 20220116072219) do

  create_table "lessons", force: :cascade do |t|
    t.string "lesson_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "month"
  end

  create_table "line_notifies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "reported_day"
    t.text "note"
    t.text "comment"
    t.integer "study_time"
    t.string "user_id"
    t.boolean "confiramtion", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_name"
    t.datetime "planed_day"
    t.datetime "completed_day"
    t.string "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userlessons", force: :cascade do |t|
    t.string "user_id"
    t.string "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.datetime "month"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
