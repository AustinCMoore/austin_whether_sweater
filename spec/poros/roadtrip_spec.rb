require "rails_helper"

RSpec.describe Roadtrip do
  it "exists with attributes" do
    VCR.use_cassette('Roadtrip Poro') do
      coordinate = CoordinateFacade.find_coordinate("pueblo,co")
      arrival_forecast = ForecastFacade.get_arrival_forecast(coordinate, 40)
      roadtrip = Roadtrip.new("denver,co", "pueblo,co", 144000, arrival_forecast)

      expect(roadtrip).to be_an_instance_of(Roadtrip)

      expect(roadtrip.id).to eq(nil)
      expect(roadtrip.start_city).to eq("denver,co")
      expect(roadtrip.end_city).to eq("pueblo,co")
      expect(roadtrip.travel_time).to eq("40 hours 0 min")
      expect(roadtrip.weather_at_eta).to be_instance_of(HourlyForecast)
    end
  end
end
