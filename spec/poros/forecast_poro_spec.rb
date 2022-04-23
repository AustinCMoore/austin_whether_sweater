require "rails_helper"

RSpec.describe ForecastPoro do
  it "exists with attributes" do
    VCR.use_cassette('Forecast Poro') do
      forecast_data = ForecastService.get_by_latlong(39.738453, -104.984853)
      forecast = ForecastPoro.new(forecast_data)

      expect(forecast).to be_an_instance_of(ForecastPoro)

      expect(forecast.current_forecast_data).to be_instance_of(Hash)
      expect(forecast.daily_forecast_data).to be_instance_of(Array)
      expect(forecast.hourly_forecast_data).to be_instance_of(Array)

      expect(forecast.current_weather).to be_instance_of(CurrentForecast)

      expect(forecast.daily_weather).to be_instance_of(Array)
      expect(forecast.daily_weather.length).to eq(5)
      expect(forecast.daily_weather.first).to be_instance_of(DailyForecast)

      expect(forecast.hourly_weather).to be_instance_of(Array)
      expect(forecast.hourly_weather.length).to eq(8)
      expect(forecast.hourly_weather.first).to be_instance_of(HourlyForecast)
    end
  end
end
