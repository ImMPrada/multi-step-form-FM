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

ActiveRecord::Schema[7.0].define(version: 2023_05_05_210256) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_addons", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "addon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "addon_id"], name: "index_account_addons_on_account_id_and_addon_id", unique: true
    t.index ["account_id"], name: "index_account_addons_on_account_id"
    t.index ["addon_id"], name: "index_account_addons_on_addon_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plan_id", null: false
    t.index ["plan_id"], name: "index_accounts_on_plan_id"
  end

  create_table "addons", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.string "status", null: false
    t.string "note"
    t.bigint "recurrence_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recurrence_id"], name: "index_addons_on_recurrence_id"
  end

  create_table "onboardings", force: :cascade do |t|
    t.string "token", null: false
    t.string "status", default: "pending", null: false
    t.integer "current_step", default: 2, null: false
    t.bigint "account_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_onboardings_on_account_id"
    t.index ["owner_id"], name: "index_onboardings_on_owner_id"
    t.index ["token"], name: "index_onboardings_on_token", unique: true
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.string "status", null: false
    t.string "note"
    t.bigint "recurrence_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recurrence_id"], name: "index_plans_on_recurrence_id"
  end

  create_table "recurrences", force: :cascade do |t|
    t.string "type", null: false
    t.float "frecuence", null: false
    t.string "acronym", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_recurrences_on_type", unique: true
  end

  create_table "suscriptions", force: :cascade do |t|
    t.string "accepted", default: "false", null: false
    t.string "status", default: "false", null: false
    t.datetime "limit_date"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_suscriptions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname"
    t.string "email", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_addons", "accounts"
  add_foreign_key "account_addons", "addons"
  add_foreign_key "accounts", "plans"
  add_foreign_key "addons", "recurrences"
  add_foreign_key "onboardings", "accounts"
  add_foreign_key "onboardings", "users", column: "owner_id"
  add_foreign_key "plans", "recurrences"
  add_foreign_key "suscriptions", "accounts"
end
