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

ActiveRecord::Schema.define(version: 2021_08_25_190544) do

  create_table "airports", force: :cascade do |t|
    t.string "code", null: false
    t.string "country"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "passenger_id"
    t.integer "booked_flights_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booked_flights_id"], name: "index_bookings_on_booked_flights_id"
    t.index ["passenger_id"], name: "index_bookings_on_passenger_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "departing_airport_id"
    t.integer "arriving_airport_id"
    t.date "date", null: false
    t.time "time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["arriving_airport_id"], name: "index_flights_on_arriving_airport_id"
    t.index ["departing_airport_id"], name: "index_flights_on_departing_airport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "flights", column: "booked_flights_id"
  add_foreign_key "bookings", "passengers"
  add_foreign_key "flights", "airports", column: "arriving_airport_id"
  add_foreign_key "flights", "airports", column: "departing_airport_id"
end
