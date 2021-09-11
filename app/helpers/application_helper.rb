module ApplicationHelper
  def format_duration(duration, return_string: false)
    result = duration.divmod(60)
    return result unless return_string

    "#{result[0]} hrs and #{result[1]} mins"
  end

  def calculate_end_time(start_time, duration)
    start = start_time.split(':').map(&:to_i)
    new_hour, new_mins = add_times(start, duration)
    zero_pad(new_hour, new_mins)
  end
  # helper_method :calculate_end_time

  def add_times(start, duration)
    vals_to_add = [format_duration(duration)]
    vals_to_add << pad_to_array(start)
    vals = add_and_collapse(vals_to_add)
    return add_times(*vals) if vals.any? { |v| v > 60 }

    vals
  end

  private

  def pad_to_array(val)
    return val if val.is_a? Array

    [val, 0]
  end

  def zero_pad(new_hour, new_mins)
    if (new_mins / 10).zero?
      "#{new_hour}:0#{new_mins}"
    elsif (new_hour / 10).zero?
      "0#{new_hour}:#{new_mins}"
    else
      "#{new_hour}:#{new_mins}"
    end
  end

  def add_and_collapse(vals)
    p vals
    vals.transpose.map { |val| val.reduce(&:+) }
  end
  
end
