require 'rails_helper'

RSpec.describe 'Road Trip request' do
  it "Gets a road trip for a given starting city and destination" do
    VCR.use_cassette("Find route") do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: SecureRandom.base64(10))
      post "/api/v1/road_trip", :params => {
                                            origin: "Denver,CO",
                                            destination: "Pueblo,CO",
                                            api_key: user.api_key,
                                          }

      expect(response).to be_successful
      roadtrip = JSON.parse(response.body, symbolize_names: true)
      expect(roadtrip).to be_a(Hash)

      expect(roadtrip).to have_key(:data)
      expect(roadtrip[:data]).to be_a(Hash)

      expect(roadtrip[:data]).to have_key(:id)
      expect(roadtrip[:data][:id]).to eq(nil) #should this be nil

      expect(roadtrip[:data]).to have_key(:type)
      expect(roadtrip[:data][:type]).to eq("roadtrip")

      expect(roadtrip[:data]).to have_key(:attributes)
      expect(roadtrip[:data][:attributes]).to be_a(Hash)

      expect(roadtrip[:data][:attributes]).to have_key(:start_city)
      expect(roadtrip[:data][:attributes][:start_city]).to be_a(String)

      expect(roadtrip[:data][:attributes]).to have_key(:end_city)
      expect(roadtrip[:data][:attributes][:end_city]).to be_a(String)

      expect(roadtrip[:data][:attributes]).to have_key(:travel_time)
      expect(roadtrip[:data][:attributes][:travel_time]).to be_a(String)

      expect(roadtrip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(roadtrip[:data][:attributes][:weather_at_eta]).to be_a(Hash)

      expect(roadtrip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(roadtrip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)

      expect(roadtrip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(roadtrip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end
end
