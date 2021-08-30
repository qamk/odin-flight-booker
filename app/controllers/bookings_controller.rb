class BookingsController < ApplicationController

  # GET /flights/:flight_id/bookings/new
  def new
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
      flash.new[:error] = 'Failed to book ticket'
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking)
  end

end
