class Api::V1::RoadTripController < ApplicationController
  def create
    travel_time_in_seconds = CoordinateFacade.find_time(params[:origin], params[:destination])
    elapsed_hours = (travel_time_in_seconds / 3600).to_i
    coordinate = CoordinateFacade.find_coordinate(params[:destination])
    arrival_forecast = ForecastFacade.get_arrival_forecast(coordinate, elapsed_hours)
    roadtrip = Roadtrip.new(params[:origin], params[:destination], travel_time_in_seconds, arrival_forecast)
    render json: RoadtripSerializer.new(roadtrip)
  end
end
