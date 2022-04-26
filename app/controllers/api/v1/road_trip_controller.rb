class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if params[:origin].nil? || params[:destination].nil? || params[:api_key].nil?
      render :status => 400
    elsif params[:origin].empty? || params[:destination].empty? || params[:api_key].empty?
      render :status => 400
    elsif user.nil?
      render :status => 401
    else
      travel_time_in_seconds = CoordinateFacade.find_time(params[:origin], params[:destination])
      if travel_time_in_seconds.nil? #destination cannot be reached or city not found
        roadtrip = Roadtrip.new(params[:origin], params[:destination], travel_time_in_seconds, " ")
        render json: RoadtripSerializer.new(roadtrip)
      else
        elapsed_hours = (travel_time_in_seconds / 3600).to_i
        coordinate = CoordinateFacade.find_coordinate(params[:destination])
        arrival_forecast = ForecastFacade.get_arrival_forecast(coordinate, elapsed_hours)
        roadtrip = Roadtrip.new(params[:origin], params[:destination], travel_time_in_seconds, arrival_forecast)
        render json: RoadtripSerializer.new(roadtrip)
      end
    end
  end
end
