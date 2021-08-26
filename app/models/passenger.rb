class Passenger < ApplicationRecord
  has_many :bookings
  has_many :booked_flights, through: :bookings

end
