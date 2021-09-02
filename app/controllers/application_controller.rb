class ApplicationController < ActionController::Base

  protected

  def calculate_end_time(start_time, duration)
    hour, mins = start_time.split(':').map(&:to_i)
    new_time = mins + duration
    new_hour = hour + (new_time / 60)
    new_mins = new_time % 60
    "#{new_hour}:#{new_mins}"
  end
  helper_method :calculate_end_time
end
