class FlightsController < ApplicationController
  def index
    @flights = Flights.all
    @queried = Flights.where(query_params) if query_params
  end

  private

  def query_params
    params.permit(:from_airport, :to_airport, :date, :time)
  end
end
