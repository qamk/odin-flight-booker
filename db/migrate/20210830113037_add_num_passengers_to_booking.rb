class AddNumPassengersToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :num_passengers, :integer
  end
end
