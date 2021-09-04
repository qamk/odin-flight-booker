class BookingsController < ApplicationController

  # GET /flights/:flight_id/bookings/new
  def new
    redirect_to root_path unless valid_passengers?(num_passengers)
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @count = (1..num_passengers).to_a
    @count.each { @booking.passengers.build }
  end

  # GET /bookings/:id
  def show
    @booking = Booking.find(params[:id])
  end

  # POST /flights/:flight_id/bookings
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Successfully booked flight'
    else
      flash.now[:error] = 'Failed to book ticket'
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booked_flight, passenger_attributes: %i[id email name])
  end

  def num_passengers
    params[:passengers].to_i
  end

  def too_many_passengers?(num)
    return false unless num.to_i > 4

    flash[:error] = 'Too many passengers'
    true
  end

end
