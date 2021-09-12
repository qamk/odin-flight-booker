class AddReferenceFromFlightsToAirports < ActiveRecord::Migration[6.1]
  def change
    add_reference :flights, :departing_airport, null: false, foreign_key: { to_table: :airports }
    add_reference :flights, :arriving_airport, null: false, foreign_key: { to_table: :airports }
  end
end
