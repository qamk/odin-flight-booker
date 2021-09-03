class BookingsController < ApplicationController

  # GET /flights/:flight_id/bookings/new
  def new
    redirect_to root_path if flash[:error]
    @booking = Booking.new
    @booking.passenger.build
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

end
