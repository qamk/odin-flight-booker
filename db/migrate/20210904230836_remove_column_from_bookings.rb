class RemoveColumnFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bookings, :booked_flights, null: false, foreign_key: {to_table: :flights}
    add_reference :bookings, :booked_flight, foreign_key: {to_table: :flights}
  end
end
