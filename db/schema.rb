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

ActiveRecord::Schema.define(version: 2020_09_17_144825) do

  create_table "entries", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "open_date"
    t.datetime "close_date"
    t.decimal "risk_in_amount"
    t.decimal "result_in_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "instrument_id"
    t.integer "setup_id", null: false
    t.integer "strategy_id", null: false
    t.integer "trade_number"
    t.decimal "pl"
    t.decimal "result_in_r"
    t.boolean "setup_quality"
    t.boolean "followed_entry_plan"
    t.boolean "followed_management_plan"
    t.string "tags"
    t.string "trade_direction"
    t.decimal "risk_in_r"
    t.index ["setup_id"], name: "index_entries_on_setup_id"
    t.index ["strategy_id"], name: "index_entries_on_strategy_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_instruments_on_name"
  end

  create_table "setups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "strategy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "strategies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "entries", "setups"
  add_foreign_key "entries", "strategies"
end
