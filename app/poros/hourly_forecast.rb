class HourlyForecast
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(forecast_data)
    @time = Time.at(forecast_data[:dt]).strftime("%H:%M:%S")
    @temperature = (forecast_data[:temp]).to_f
    @conditions = forecast_data[:weather][0][:description]
    @icon = forecast_data[:weather][0][:icon]
  end
end
