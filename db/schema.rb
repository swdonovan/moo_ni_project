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

ActiveRecord::Schema.define(version: 20170721135624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeder_cow_transactions", force: :cascade do |t|
    t.bigint "transaction_id"
    t.bigint "feeder_cow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feeder_cow_id"], name: "index_feeder_cow_transactions_on_feeder_cow_id"
    t.index ["transaction_id"], name: "index_feeder_cow_transactions_on_transaction_id"
  end

  create_table "feeder_cows", force: :cascade do |t|
    t.integer "tag_number"
    t.bigint "residence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "life_status", default: 0
    t.index ["residence_id"], name: "index_feeder_cows_on_residence_id"
  end

  create_table "feeder_weights", force: :cascade do |t|
    t.bigint "feeder_cow_id"
    t.integer "weight"
    t.integer "weight_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feeder_cow_id"], name: "index_feeder_weights_on_feeder_cow_id"
  end

  create_table "ranch_transactions", force: :cascade do |t|
    t.bigint "company_id"
    t.date "date"
    t.decimal "amount"
    t.integer "transaction_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_ranch_transactions_on_company_id"
  end

  create_table "residences", force: :cascade do |t|
    t.string "name"
    t.integer "max_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_path"
    t.integer "occupancy", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "feeder_cow_transactions", "feeder_cows"
  add_foreign_key "feeder_cow_transactions", "ranch_transactions", column: "transaction_id"
  add_foreign_key "feeder_cows", "residences"
  add_foreign_key "feeder_weights", "feeder_cows"
  add_foreign_key "ranch_transactions", "companies"
end
