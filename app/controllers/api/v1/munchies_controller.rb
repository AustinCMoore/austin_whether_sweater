class Api::V1::MunchiesController < ApplicationController
  def index
    #find travel time
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
