class PassengerMailer < ApplicationMailer
  def confirmation(booking)
    @flight_details = extract_flight_details(booking.booked_flight)
    @passengers = booking.passengers
    passengers_email = passengers.pluck(:email)
    mail(to: passengers_email, subject: 'Your booking has been made!')
  end

  private

  def extract_flight_details(flight)
    departing_airport = flight.departing_airport
    arriving_airport = flight.arriving_airport
    duration = flight.duration
    start_time = format_start(flight.time)
    {
      departing: departing_airport, arriving: arriving_airport,
      end_time: calculate_end_time(start_time, duration),
      flight: flight
    }
  end

end
