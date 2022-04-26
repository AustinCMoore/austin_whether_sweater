class ForecastPoro
  attr_reader :current_forecast_data,
              :daily_forecast_data,
              :hourly_forecast_data,
              :current_weather,
              :daily_weather,
              :hourly_weather,
              :id

  def initialize(forecast_data)
    @id = nil
    @current_forecast_data = forecast_data[:current]
    @daily_forecast_data = forecast_data[:daily]
    @hourly_forecast_data = forecast_data[:hourly]
  end

  def current_weather
    CurrentForecast.new(@current_forecast_data)
  end

  def daily_weather
    forecast = @daily_forecast_data.first(5).map do |day|
      DailyForecast.new(day)
    end
    return forecast
  end

  def hourly_weather
    forecast = @hourly_forecast_data.first(8).map do |hour|
      HourlyForecast.new(hour)
    end
    return forecast
  end
end
