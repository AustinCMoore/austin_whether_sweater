class Api::V1::ForecastController < ApplicationController
  def index
    coordinate = CoordinateFacade.find_coordinate(params[:location]) #was a facade even necessary?
    forecast = ForecastFacade.find_forecast(coordinate)
      #returns forecast poro
    render json: ForecastFacadeSerializer.new(forecast)
  end
end
