require 'rails_helper'

RSpec.describe 'Forecast request' do
  it "Gets lat/long for a given location" do
    get "/api/v1/forecast?location=denver,co"
  end
end
