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

ActiveRecord::Schema[7.0].define(version: 2023_11_02_064800) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developers", force: :cascade do |t|
    t.string "specilization"
    t.string "name"
    t.integer "age"
    t.string "phoneNo"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "newuser_id"
    t.index ["newuser_id"], name: "index_developers_on_newuser_id"
  end

  create_table "newusers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "organization"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_newusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_newusers_on_reset_password_token", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.date "starting_date"
    t.date "ending_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "newuser_id"
    t.index ["newuser_id"], name: "index_projects_on_newuser_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.string "ticketNo"
    t.string "task_type"
    t.date "ending_date"
    t.integer "priority"
    t.bigint "project_id"
    t.bigint "developer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_tasks_on_developer_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  add_foreign_key "developers", "newusers"
  add_foreign_key "projects", "newusers"
  add_foreign_key "tasks", "projects"
end
