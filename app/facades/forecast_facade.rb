class ForecastFacade
  def self.get_forecast(coordinate)
    forecast_data = ForecastService.get_by_latlong(coordinate.latitude, coordinate.longitude)
    ForecastPoro.new(forecast_data)
  end
end
