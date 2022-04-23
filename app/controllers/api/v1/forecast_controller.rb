class Api::V1::ForecastController < ApplicationController
  def index
    coordinate = CoordinateFacade.find_coordinates(params[:location])
      #returns long/lat as hash
    forecast = ForecastFacade.find_forecast(coordinates)
      #returns hashed forecast data
    render json: ForecastFacadeSerializer.new(forecast)
  end
end
