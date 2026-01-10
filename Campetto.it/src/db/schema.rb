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

ActiveRecord::Schema.define(version: 2025_11_12_154115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "surname"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "root", default: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "slot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_intent_id"
    t.index ["slot_id"], name: "index_bookings_on_slot_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "nome"
    t.text "descrizione"
    t.string "sport"
    t.decimal "prezzo"
    t.decimal "latitudine"
    t.decimal "longitudine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "interval"
    t.string "exclude_days"
    t.string "indirizzo"
    t.string "via"
    t.string "citta"
    t.string "cap"
    t.bigint "sports_center_id"
    t.index ["sports_center_id"], name: "index_fields_on_sports_center_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "gender"
    t.date "birthdate"
    t.string "mobile"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_partners_on_email", unique: true
  end

  create_table "partners_sports_centers", id: false, force: :cascade do |t|
    t.bigint "partner_id", null: false
    t.bigint "sports_center_id", null: false
    t.index ["partner_id", "sports_center_id"], name: "index_partners_sports_centers_on_partner_and_center", unique: true
    t.index ["sports_center_id", "partner_id"], name: "index_sports_centers_partners_on_center_and_partner", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.string "reportable_type"
    t.bigint "reportable_id"
    t.string "reporter_type"
    t.bigint "reporter_id"
    t.integer "status", default: 0
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reportable_type", "reportable_id"], name: "index_reports_on_reportable_type_and_reportable_id"
    t.index ["reporter_type", "reporter_id"], name: "index_reports_on_reporter_type_and_reporter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "titolo"
    t.integer "valutazione"
    t.text "testo"
    t.bigint "user_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_reviews_on_field_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "slots", force: :cascade do |t|
    t.bigint "field_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "booked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_slots_on_field_id"
  end

  create_table "sports_centers", force: :cascade do |t|
    t.string "tax_code"
    t.string "vat_number"
    t.string "company_name"
    t.string "iban"
    t.string "email"
    t.string "phone"
    t.string "registered_office"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_sports_centers_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
    t.datetime "confirmed_at"
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string "nome"
    t.string "cognome"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "slots"
  add_foreign_key "bookings", "users"
  add_foreign_key "fields", "sports_centers"
  add_foreign_key "reviews", "fields"
  add_foreign_key "reviews", "users"
  add_foreign_key "slots", "fields"
  add_foreign_key "sports_centers", "partners", column: "owner_id"
end
