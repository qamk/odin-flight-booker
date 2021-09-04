class Passenger < ApplicationRecord
  belongs_to :booking
  has_many :booked_flights, through: :bookings

  validates :email, :name, presence: true
end
