class Passenger < ApplicationRecord
  belongs_to :booking
  has_many :booked_flights, through: :bookings

  validates :email, :name, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
end
