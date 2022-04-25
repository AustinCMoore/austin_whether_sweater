class Api::V1::MunchiesController < ApplicationController
  def index #refactor goal; slim this down
    travel_time_in_seconds = CoordinateFacade.find_time(params[:start], params[:destination])
    arrival_time = (Time.now + travel_time_in_seconds.seconds).to_i
    restaurant = RestaurantFacade.get_restaurant(params[:destination], arrival_time, params[:food])
    coordinate = CoordinateFacade.find_coordinate(params[:destination])
    forecast = ForecastFacade.get_forecast(coordinate)
    munchie = Munchie.new(params[:destination], travel_time_in_seconds, forecast.current_weather, restaurant)
    render json: MunchieSerializer.new(munchie)
  end
end
