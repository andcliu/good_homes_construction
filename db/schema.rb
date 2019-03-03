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

ActiveRecord::Schema.define(version: 20190303184225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.integer "zipcode"
    t.string "phone"
    t.string "phone2"
    t.string "email"
    t.date "onboard_date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_informations", force: :cascade do |t|
    t.date "dob"
    t.string "address"
    t.string "city"
    t.integer "zipcode"
    t.string "phone"
    t.string "phone2"
    t.string "email"
    t.float "current_wage"
    t.float "previous_wage"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_informations_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "hire_date"
    t.date "termination_date"
    t.boolean "is_manager"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.text "description"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.date "start_date"
    t.date "completion_date"
    t.text "task_description"
    t.text "notes"
    t.text "employee_id", default: [], array: true
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_milestones_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.float "estimated_amount"
    t.float "final_amount"
    t.date "estimated_start_date"
    t.date "actual_start_date"
    t.date "completion_date"
    t.boolean "is_completed"
    t.string "blueprints_url"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "project_name"
    t.float "estimate"
    t.text "work_description"
    t.boolean "is_approved"
    t.boolean "is_cancelled"
    t.date "date_approved"
    t.date "date_cancelled"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_quotes_on_client_id"
  end

  create_table "work_days", force: :cascade do |t|
    t.date "work_date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_schedules", force: :cascade do |t|
    t.float "hours"
    t.text "work_description"
    t.text "notes"
    t.bigint "employee_id"
    t.bigint "client_id"
    t.bigint "work_day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_work_schedules_on_client_id"
    t.index ["employee_id"], name: "index_work_schedules_on_employee_id"
    t.index ["work_day_id"], name: "index_work_schedules_on_work_day_id"
  end

  add_foreign_key "employee_informations", "employees"
  add_foreign_key "items", "categories"
  add_foreign_key "milestones", "projects"
  add_foreign_key "quotes", "clients"
  add_foreign_key "work_schedules", "clients"
  add_foreign_key "work_schedules", "employees"
  add_foreign_key "work_schedules", "work_days"
end
