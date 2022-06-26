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

ActiveRecord::Schema[7.0].define(version: 2022_06_26_034213) do
  create_table "credit_transfer_payment_debtors", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.string "bic", limit: 11, null: false
    t.string "iban", limit: 34, null: false
    t.integer "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_credit_transfer_payment_debtors_on_payment_id"
  end

  create_table "credit_transfer_payment_transactions", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.string "bic", limit: 11, null: false
    t.string "iban", limit: 34, null: false
    t.decimal "amount", null: false
    t.string "currency", limit: 3, default: "EUR", null: false
    t.string "instruction", limit: 35
    t.string "reference", limit: 35
    t.string "remittance_information", limit: 140
    t.date "requested_date"
    t.boolean "batch_booking", default: false, null: false
    t.integer "service_level"
    t.string "category_purpose"
    t.integer "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_credit_transfer_payment_transactions_on_payment_id"
  end

  create_table "direct_debit_payment_creditors", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.string "bic", limit: 11, null: false
    t.string "iban", limit: 34, null: false
    t.string "creditor_identifier", limit: 35, null: false
    t.integer "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_direct_debit_payment_creditors_on_payment_id"
  end

  create_table "direct_debit_payment_transactions", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.string "bic", limit: 11, null: false
    t.string "iban", limit: 34, null: false
    t.decimal "amount", null: false
    t.string "currency", limit: 3, default: "EUR", null: false
    t.string "instruction", limit: 35
    t.string "reference", limit: 35
    t.string "remittance_information", limit: 140
    t.string "mandate_id", limit: 35
    t.date "mandate_date_of_signature", null: false
    t.integer "local_instrument", null: false
    t.integer "sequence_type", null: false
    t.date "requested_date"
    t.boolean "batch_booking", default: false, null: false
    t.integer "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_direct_debit_payment_transactions_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.text "xml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "credit_transfer_payment_debtors", "payments"
  add_foreign_key "credit_transfer_payment_transactions", "payments"
  add_foreign_key "direct_debit_payment_creditors", "payments"
  add_foreign_key "direct_debit_payment_transactions", "payments"
end
