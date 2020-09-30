# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_30_183800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "schedule_id"
    t.index ["schedule_id"], name: "index_food_access_points_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "day"
    t.string "open_hours"
    t.string "close_hours"
    t.bigint "food_access_point_id"
    t.index ["food_access_point_id"], name: "index_schedules_on_food_access_point_id"
  end

end
