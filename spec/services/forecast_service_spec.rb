require 'rails_helper'

RSpec.describe 'The Forecast Service' do
  it ".get_by_latlong" do
    VCR.use_cassette('.get_by_latlong') do
      forecast = ForecastService.get_by_latlong(39.738453, -104.984853)
      expect(forecast).to be_instance_of(Hash)
      expect(forecast).to have_key(:current)
      expect(forecast).to have_key(:daily)
      expect(forecast).to have_key(:hourly)
    end
  end
end
