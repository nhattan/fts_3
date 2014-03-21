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

ActiveRecord::Schema.define(version: 20140321064545) do

  create_table "course_subjects", force: true do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_at"
  end

  add_index "courses", ["name"], name: "index_courses_on_name"

  create_table "reports", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id"

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supervisor_courses", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "start_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supervisor_courses", ["course_id"], name: "index_supervisor_courses_on_course_id"
  add_index "supervisor_courses", ["user_id"], name: "index_supervisor_courses_on_user_id"

  create_table "tasks", force: true do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["subject_id"], name: "index_tasks_on_subject_id"

  create_table "trainee_courses", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "start_at"
    t.integer  "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_subjects", force: true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.boolean  "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_subjects", ["subject_id"], name: "index_user_subjects_on_subject_id"
  add_index "user_subjects", ["user_id"], name: "index_user_subjects_on_user_id"

  create_table "user_tasks", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.boolean  "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_tasks", ["task_id"], name: "index_user_tasks_on_task_id"
  add_index "user_tasks", ["user_id"], name: "index_user_tasks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "supervisor",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
