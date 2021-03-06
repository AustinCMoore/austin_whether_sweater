require 'rails_helper'

RSpec.describe 'The Forecast Service' do
  it ".get_by_latlong" do
    VCR.use_cassette('.get_by_latlong') do
      forecast = ForecastService.get_by_latlong(39.738453, -104.984853)
      expect(forecast).to be_instance_of(Hash)
      expect(forecast).to have_key(:current)
      expect(forecast).to have_key(:daily)
      expect(forecast).to have_key(:hourly)
      expect(forecast).to_not have_key(:minutely)
      expect(forecast).to_not have_key(:alerts)
    end
  end

  it ".get_by_hour" do
    VCR.use_cassette('.get_by_hour') do
      forecast = ForecastService.get_by_hour(39.738453, -104.984853)
      expect(forecast).to be_instance_of(Hash)
      expect(forecast).to have_key(:hourly)
      expect(forecast).to_not have_key(:current)
      expect(forecast).to_not have_key(:daily)
      expect(forecast).to_not have_key(:minutely)
      expect(forecast).to_not have_key(:alerts)
    end
  end
end
