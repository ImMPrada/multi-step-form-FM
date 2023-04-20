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

ActiveRecord::Schema[7.0].define(version: 2023_04_20_200410) do
  create_table "accounts", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plan_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["plan_id"], name: "index_accounts_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.string "frequence", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_plans_on_name", unique: true
  end

  add_foreign_key "accounts", "plans"
end
