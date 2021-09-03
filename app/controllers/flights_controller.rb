class FlightsController < ApplicationController
  def index
    @airports = Airport.select(:id, :code, :city).map { |airport| ["#{airport.code} - #{airport.city}", airport.id] }
    @dates = Flight.select(:date).distinct.pluck(:date)
    if valid_search?
      @queried = Flight.where(query_params).includes(:departing_airport)
    else
      flash[:error] = 'Departing and Arriving airport cannot be the same'
    end
  end

  protected

  def valid_search?
    params[:departing_airport] != params[:arriving_airport]
  end
  helper_method :valid_search?

  private


  def cleaned_query_params
    query_params
    date = Date.new(*(1..3).map { |num| params[:search]["date(#{num}i)"].to_i })
    {
      departing_airport: params[:search][:departing_airport],
      arriving_airport: params[:search][:arriving_airport],
      date: date
    }
  end

  def query_params
    params.permit(:departing_airport, :arriving_airport, :date)
  end
end
