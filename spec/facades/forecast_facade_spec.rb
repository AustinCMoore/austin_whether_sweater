require 'rails_helper'

RSpec.describe 'The Forecast Facade' do
  it ".get_forecast" do
    VCR.use_cassette('.get_forecast') do
      coordinate_data = CoordinateService.search_for_location("denver,co")
      coordinate = CoordinatePoro.new(coordinate_data)
      forecast = ForecastFacade.get_forecast(coordinate)
      expect(forecast).to be_instance_of(ForecastPoro)
    end
  end

  it ".get_arrival_forecast" do
    VCR.use_cassette('.get_arrival_forecast') do
      coordinate_data = CoordinateService.search_for_location("denver,co")
      coordinate = CoordinatePoro.new(coordinate_data)
      forecast = ForecastFacade.get_arrival_forecast(coordinate, 40)
      expect(forecast).to be_instance_of(HourlyForecast)
    end
  end
end
