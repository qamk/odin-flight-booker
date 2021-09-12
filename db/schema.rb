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

ActiveRecord::Schema.define(version: 2021_09_12_123430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code", null: false
    t.string "country"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "num_passengers"
    t.bigint "booked_flight_id"
    t.index ["booked_flight_id"], name: "index_bookings_on_booked_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.date "date", null: false
    t.time "time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration"
    t.bigint "departing_airport_id", null: false
    t.bigint "arriving_airport_id", null: false
    t.index ["arriving_airport_id"], name: "index_flights_on_arriving_airport_id"
    t.index ["departing_airport_id"], name: "index_flights_on_departing_airport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  add_foreign_key "bookings", "flights", column: "booked_flight_id"
  add_foreign_key "flights", "airports", column: "arriving_airport_id"
  add_foreign_key "flights", "airports", column: "departing_airport_id"
  add_foreign_key "passengers", "bookings"
end
