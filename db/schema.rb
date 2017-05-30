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

ActiveRecord::Schema.define(version: 20170530153026) do

  create_table "loans", force: :cascade do |t|
    t.string   "title"
    t.decimal  "amount",                       null: false
    t.integer  "term",            default: 6,  null: false
    t.integer  "period",          default: 1,  null: false
    t.integer  "year_rate",       default: 30, null: false
    t.integer  "expiration_rate", default: 50, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "month",                        null: false
    t.boolean  "expiration",   default: false, null: false
    t.boolean  "last_payment", default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id"
  end

end
