class BookingsController < ApplicationController
  # GET /flights/:flight_id/bookings/new
  def new
    redirect_to root_path unless valid_passengers?(num_passengers)
    @booking = Booking.new
    @flight = grab_flight
    @count = (1..num_passengers).to_a
    @count.each { @booking.passengers.build }
  end

  # GET /bookings/:id
  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.booked_flight
  end

  # POST /flights/:flight_id/bookings
  def create
    cleaned_booking_params = convert_ids(booking_params)
    @booking = Booking.new(cleaned_booking_params)
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Successfully booked flight'
      PassengerMailer.confirmation(@booking).deliver_now
    else
      flash.now[:error] = 'Failed to book ticket'
      grab_flight
      render 'new'
    end
  end

  private

  def convert_ids(params)
    params[:booked_flight] = Flight.find(params[:booked_flight].to_i)
    params[:num_passengers] = params[:num_passengers].to_i
    params
  end

  def booking_params
    params.require(:booking).permit(:booked_flight, :num_passengers, { passengers_attributes: %i[id email name] })
  end

  def num_passengers
    params[:passengers].to_i
  end

  def too_many_passengers?(num)
    return false unless num.to_i > 4

    flash[:error] = 'Too many passengers'
    true
  end

  def grab_flight
    Flight.find(params[:flight_id])
  end

end
