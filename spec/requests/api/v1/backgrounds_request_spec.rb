require 'rails_helper'

RSpec.describe 'Background request' do
  it "Gets a Background for a given city" do
    VCR.use_cassette("Find background") do
      get "/api/v1/backgrounds?location=denver,co"

      expect(response).to be_successful
    end
  end
end
