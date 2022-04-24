class ForecastSerializer
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

  attributes :daily_weather do |forecast|
    forecast.daily_weather.each do |day|
      {
        date: day.date,
        sunrise: day.sunrise,
        sunset: day.sunset,
        max_temp: day.max_temp,
        min_temp: day.min_temp,
        conditions: day.conditions,
        icon: day.icon
      }
    end
  end

  attributes :hourly_weather do |forecast|
    forecast.hourly_weather.each do |day|
      {
        time: day.time,
        temperature: day.temperature,
        conditions: day.conditions,
        icon: day.icon
      }
    end
  end
end
