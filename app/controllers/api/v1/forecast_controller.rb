class Api::V1::ForecastController < ApplicationController
  def index
    coordinate = CoordinateFacade.find_coordinate(params[:location])
    forecast = ForecastFacade.get_forecast(coordinate)
    render json: ForecastSerializer.new(forecast)
  end
end
