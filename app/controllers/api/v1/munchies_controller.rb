class Api::V1::MunchiesController < ApplicationController
  def index
    travel_time_in_seconds = CoordinateFacade.find_time(params[:start], params[:destination])
    travel_time_in_minutes = travel_time_in_seconds/60
    travel_time_in_hours = travel_time_in_minutes/60
    
    binding.pry
    #find arrival time (current time + travel time)
    #find restaurant
      #if arrival time in hours happy path
      #else sad path
    #find forecast for location

    # coordinate = CoordinateFacade.find_coordinate(params[:location]) #was a facade even necessary?
    # forecast = ForecastFacade.get_forecast(coordinate)
    # render json: ForecastSerializer.new(forecast)
  end
end
