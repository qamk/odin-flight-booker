class FlightsController < ApplicationController
  def index
    @airports = Airport.select(:id, :code, :city).map { |airport| ["#{airport.code} - #{airport.city}", airport.id] }
    @dates = Flight.select(:date).distinct.pluck(:date)
    if valid_flight? && valid_passengers?(num_passengers)
      @queried = query_flights
    elsif query_made?
      flash[:error] = 'Please ensure your query is valid'
    end
  end

  protected

  def valid_flight?
    a = params[:departing_airport]
    b = params[:arriving_airport]
    (a != b) && [a, b].none?(&:nil?)
  end
  helper_method :valid_flight?

  private

  def query_made?
    query_param_keys = %i[departing_airport arriving_airport date num_passengers] 
    params.keys.any? { |k| query_param_keys.include? k }
  end

  def query_flights
    Flight.where(departing_airport: params[:departing_airport],
                arriving_airport: params[:arriving_airport],
                date: params[:date])
          .includes(:departing_airport)
      
  end

  def num_passengers
    params[:num_passengers].to_i
  end

  def query_params
    params.permit(:departing_airport, :arriving_airport, :date, :num_passengers)
  end
end
