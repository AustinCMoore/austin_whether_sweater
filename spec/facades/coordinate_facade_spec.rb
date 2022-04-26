require 'rails_helper'

RSpec.describe 'The Coordinate Facade' do
  it ".find_coordinate" do
    VCR.use_cassette('.find_coordinate') do
      coordinate = CoordinateFacade.find_coordinate("denver,co")
      expect(coordinate).to be_instance_of(CoordinatePoro)
    end
  end

  it ".find_time" do
    VCR.use_cassette('.find_time') do
      time = CoordinateFacade.find_time("denver,co", "pueblo,co")
      expect(time).to be_an(Integer)
    end
  end
end
