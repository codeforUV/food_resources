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

ActiveRecord::Schema.define(version: 2022_01_30_025658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessibility_for_disabilities", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.string "accessibility"
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_accessibility_for_disabilities_on_location_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "service_id"
    t.bigint "service_at_location_id"
    t.string "name"
    t.string "title"
    t.string "department"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_contacts_on_organization_id"
    t.index ["service_at_location_id"], name: "index_contacts_on_service_at_location_id"
    t.index ["service_id"], name: "index_contacts_on_service_id"
  end

  create_table "eligibilities", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_eligibilities_on_service_id"
  end

  create_table "food_access_points", force: :cascade do |t|
    t.string "address"
    t.string "town"
    t.string "state"
    t.string "zip"
    t.string "name"
    t.string "phone_number"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_food_access_points_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "location_id"
    t.string "language", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_languages_on_location_id"
    t.index ["service_id"], name: "index_languages_on_service_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "description"
    t.integer "latitude"
    t.integer "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_locations_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "email"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phones", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "service_id"
    t.bigint "organization_id"
    t.bigint "contact_id"
    t.bigint "service_at_location_id"
    t.string "number", null: false
    t.integer "extension"
    t.string "type"
    t.string "language"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_phones_on_contact_id"
    t.index ["location_id"], name: "index_phones_on_location_id"
    t.index ["organization_id"], name: "index_phones_on_organization_id"
    t.index ["service_at_location_id"], name: "index_phones_on_service_at_location_id"
    t.index ["service_id"], name: "index_phones_on_service_id"
  end

  create_table "physical_addresses", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.string "attention"
    t.string "address", null: false
    t.string "city", null: false
    t.string "region"
    t.string "state_province", null: false
    t.string "postal_code", null: false
    t.string "country", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_physical_addresses_on_location_id"
  end

  create_table "required_documents", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.string "document", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_required_documents_on_service_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "location_id"
    t.bigint "service_at_location_id"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.datetime "dtstart"
    t.integer "timezone"
    t.datetime "until"
    t.integer "count"
    t.string "wkst"
    t.string "freq"
    t.integer "interval"
    t.string "byday"
    t.string "byweekno"
    t.integer "bymonthday"
    t.integer "byyearday"
    t.string "description"
    t.datetime "opens_at"
    t.datetime "closes_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_schedules_on_location_id"
    t.index ["service_at_location_id"], name: "index_schedules_on_service_at_location_id"
    t.index ["service_id"], name: "index_schedules_on_service_id"
  end

  create_table "service_at_locations", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "location_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_service_at_locations_on_location_id"
    t.index ["service_id"], name: "index_service_at_locations_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.string "description"
    t.string "url"
    t.string "email"
    t.string "interpretation_services"
    t.string "application_process"
    t.string "fees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_services_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "session_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

  add_foreign_key "food_access_points", "users"
end
