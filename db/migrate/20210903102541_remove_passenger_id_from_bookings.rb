class RemovePassengerIdFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bookings, :passenger, foreign_key: true
    add_reference :passengers, :booking, foreign_key: true
  end
end
