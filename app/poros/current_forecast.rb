class CurrentForecast
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(forecast_data)
    @datetime = Time.at(forecast_data[:dt]).to_s
    @sunrise = Time.at(forecast_data[:sunrise]).to_s
    @sunset = Time.at(forecast_data[:sunset]).to_s
    @temperature = (forecast_data[:temp]).to_f
    @feels_like = (forecast_data[:feels_like]).to_f
    @humidity = (forecast_data[:humidity]).to_f
    @uvi = (forecast_data[:uvi]).to_f
    @visibility = (forecast_data[:visibility]).to_f
    @conditions = forecast_data[:weather][0][:description]
    @icon = forecast_data[:weather][0][:icon]
  end
end
