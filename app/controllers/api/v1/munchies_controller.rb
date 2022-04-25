class Api::V1::MunchiesController < ApplicationController
  def index
    # coordinate = CoordinateFacade.find_coordinate(params[:location]) #was a facade even necessary?
    # forecast = ForecastFacade.get_forecast(coordinate)
    # render json: ForecastSerializer.new(forecast)
  end
end
