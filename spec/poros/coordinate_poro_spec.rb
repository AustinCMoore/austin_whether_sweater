require "rails_helper"

RSpec.describe CoordinatePoro do
  it "exists with attributes" do
    VCR.use_cassette('.search_for_location') do
      coordinate_data = CoordinateService.search_for_location("denver,co")
      coordinate = CoordinatePoro.new(coordinate_data)

      expect(coordinate).to be_an_instance_of(CoordinatePoro)

      expect(coordinate.latitude).to be_instance_of(Float)
      expect(coordinate.latitude).to eq(39.738453)

      expect(coordinate.longitude).to be_instance_of(Float)
      expect(coordinate.longitude).to eq(-104.984853)
    end
  end
end
