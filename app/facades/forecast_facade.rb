class ForecastFacade
  def self.get_forecast(coordinate)
    forecast_data = ForecastService.get_by_latlong(coordinate.latitude, coordinate.longitude)
    ForecastPoro.new(forecast_data)
  end

  def self.get_arrival_forecast(coordinate, elapsed_hours)
    forecast_data = ForecastService.get_by_hour(coordinate.latitude, coordinate.longitude)
    HourlyForecast.new(forecast_data[:hourly][elapsed_hours])
  end
end
