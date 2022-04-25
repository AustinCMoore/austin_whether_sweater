require 'rails_helper'

RSpec.describe 'Munchies request' do
  it "Gets a restaurant for a given state, city, food type" do
    VCR.use_cassette("Find munchies") do
      get "/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese"

      expect(response).to be_successful
      munchies = JSON.parse(response.body, symbolize_names: true)
      expect(munchies).to be_a(Hash)

      expect(munchies).to have_key(:data)
      expect(munchies[:data]).to be_a(Hash)

      expect(munchies[:data]).to have_key(:id)
      expect(munchies[:data][:id]).to eq(nil)

      expect(munchies[:data]).to have_key(:type)
      expect(munchies[:data][:type]).to eq("munchie")

      expect(munchies[:data]).to have_key(:attributes)
      expect(munchies[:data][:attributes]).to be_a(Hash)

      expect(munchies[:data][:attributes]).to have_key(:destination_city)
      expect(munchies[:data][:attributes][:destination_city]).to be_a(String)

      expect(munchies[:data][:attributes]).to have_key(:travel_time)
      expect(munchies[:data][:attributes][:travel_time]).to be_a(String)

      expect(munchies[:data][:attributes]).to have_key(:forecast)
      expect(munchies[:data][:attributes][:forecast]).to be_a(Hash)

      expect(munchies[:data][:attributes][:forecast]).to have_key(:summary)
      expect(munchies[:data][:attributes][:forecast][:summary]).to be_a(String)

      expect(munchies[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(munchies[:data][:attributes][:forecast][:temperature]).to be_a(String)

      expect(munchies[:data][:attributes]).to have_key(:restaurant)
      expect(munchies[:data][:attributes][:restaurant]).to be_a(Hash)

      expect(munchies[:data][:attributes][:restaurant]).to have_key(:name)
      expect(munchies[:data][:attributes][:restaurant][:name]).to be_a(String)

      expect(munchies[:data][:attributes][:restaurant]).to have_key(:address)
      expect(munchies[:data][:attributes][:restaurant][:address]).to be_a(String)
    end
  end
end
