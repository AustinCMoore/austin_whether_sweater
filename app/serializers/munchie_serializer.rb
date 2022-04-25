class MunchieSerializer
  include JSONAPI::Serializer
  attributes :id

  attributes :current_weather do |forecast|
    {
      datetime: forecast.current_weather.datetime,
      sunrise: forecast.current_weather.sunrise,
      sunset: forecast.current_weather.sunset,
      temperature: forecast.current_weather.temperature,
      feels_like: forecast.current_weather.feels_like,
      humidity: forecast.current_weather.humidity,
      uvi: forecast.current_weather.uvi,
      visibility: forecast.current_weather.visibility,
      conditions: forecast.current_weather.conditions,
      icon: forecast.current_weather.icon
    }
  end
end
