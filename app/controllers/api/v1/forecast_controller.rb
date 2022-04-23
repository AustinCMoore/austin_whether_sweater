class Api::V1::ForecastController < ApplicationController
  def index
    coordinate = CoordinateFacade.find_coordinate(params[:location]) #was a facade even necessary?
    forecast = ForecastFacade.get_forecast(coordinate)
    # render json: ForecastFacadeSerializer.new(forecast)
  end
end
