class Booking < ApplicationRecord
  belongs_to :booked_flight, class_name: 'Flight'
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers

  validates :num_passengers, presence: true, numericality: { greater_than: 0, less_than: 5 }
end
