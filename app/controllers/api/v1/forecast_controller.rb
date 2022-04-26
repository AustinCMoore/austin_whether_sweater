class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].nil?
      render :status => 400 #nil params
    elsif params[:location].empty?
      render :status => 400 #nil params
    else
      coordinate = CoordinateFacade.find_coordinate(params[:location])
      forecast = ForecastFacade.get_forecast(coordinate)
      render json: ForecastSerializer.new(forecast)
    end
  end
end
