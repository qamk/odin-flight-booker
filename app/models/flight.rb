class Flight < ApplicationRecord
  has_many :bookings, foreign_key: :booked_flight_id
  has_many :passengers, through: :bookings
  belongs_to :departing_airport, class_name: 'Airport'
  belongs_to :arriving_airport, class_name: 'Airport'
end
