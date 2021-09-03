class Booking < ApplicationRecord
  belongs_to :booked_flight, class_name: 'Flight'
  has_many :passengers
  accepts_nested_attributes_for :passenger

  validates :num_passengers, presence: true
end
