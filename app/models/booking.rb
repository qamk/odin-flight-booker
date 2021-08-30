class Booking < ApplicationRecord
  belongs_to :passenger
  belongs_to :booked_flight, class_name: 'Flight'
  accepts_nested_attributes_for :passenger
end
