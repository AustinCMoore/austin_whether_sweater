require 'rails_helper'

RSpec.describe 'Background request' do
  it "Gets a Background for a given city" do
    VCR.use_cassette("Find background") do
      get "/api/v1/backgrounds?location=denver,co"

      expect(response).to be_successful
      background = JSON.parse(response.body, symbolize_names: true)
      expect(background).to be_a(Hash)

      expect(background).to have_key(:data)
      expect(background[:data]).to be_a(Hash)

      expect(background[:data]).to have_key(:id)
      expect(background[:data][:id]).to eq(nil) #should this be nil

      expect(background[:data]).to have_key(:type)
      expect(background[:data][:type]).to eq("image")

      expect(background[:data][:attributes]).to have_key(:url)
      expect(background[:data][:attributes][:url]).to be_a(String)

      expect(background[:data][:attributes]).to have_key(:photographer)
      expect(background[:data][:attributes][:photographer]).to be_a(String)
    end
  end
end
