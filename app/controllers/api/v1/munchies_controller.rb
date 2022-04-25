class Api::V1::MunchiesController < ApplicationController
  def index
    travel_time_in_seconds = CoordinateFacade.find_time(params[:start], params[:destination])
    arrival_time = (Time.now + travel_time_in_seconds.seconds).to_i
    restaurant = RestaurantFacade.get_restaurant(params[:destination], arrival_time, params[:food])
    binding.pry
    #find arrival time (current time + travel time)
    #find forecast for location

    # coordinate = CoordinateFacade.find_coordinate(params[:location]) #was a facade even necessary?
    # forecast = ForecastFacade.get_forecast(coordinate)
    # render json: ForecastSerializer.new(forecast)
  end
end
