require 'rails_helper'

RSpec.describe 'The Coordinate Service' do
  it ".search_for_location" do
    VCR.use_cassette('.search_for_location') do
      coordinate = CoordinateService.search_for_location("denver,co")
      expect(coordinate).to be_instance_of(Hash)
      expect(coordinate[:results].first[:locations].first[:latLng]).to have_key(:lat)
      expect(coordinate[:results].first[:locations].first[:latLng]).to have_key(:lng)
    end
  end

  it ".get_time_between" do
    VCR.use_cassette('.get_time_between') do
      route = CoordinateService.get_time_between("denver,co", "pueblo,co")
      expect(route).to be_instance_of(Hash)
      expect(route[:route]).to have_key(:realTime)
    end
  end
end
