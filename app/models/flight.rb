class Flight < ApplicationRecord
  has_many :bookings
  has_many :passengers
  belongs_to :departing_airport, class_name: 'Airport'
  belongs_to :arriving_airport, class_name: 'Airport'
end
