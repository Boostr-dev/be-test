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

ActiveRecord::Schema[7.0].define(version: 2024_04_29_141132) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "manager_id"
    t.boolean "active", default: false, null: false
    t.string "name", null: false
    t.decimal "budget", default: "0.0", null: false
    t.integer "employee_count", default: 0, null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
    t.index ["manager_id"], name: "index_departments_on_manager_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "department_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.decimal "salary", default: "0.0", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

end
