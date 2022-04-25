require 'rails_helper'

RSpec.describe 'Sessions request' do
  it "Logs a user in" do
    created_user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: SecureRandom.base64(10))
    post "/api/v1/sessions", :params => {
                                          email: "whatever@example.com",
                                          password: "password"
                                        }
    expect(response).to be_successful
    found_user = JSON.parse(response.body, symbolize_names: true)
    expect(found_user).to have_key(:data)

    expect(found_user[:data]).to have_key(:id)
    expect(found_user[:data][:id]).to be_an(String)
    expect(found_user[:data][:id]).to eq(created_user.id.to_s)

    expect(found_user[:data]).to have_key(:type)
    expect(found_user[:data][:type]).to eq("users")

    expect(found_user[:data]).to have_key(:attributes)
    expect(found_user[:data][:attributes]).to be_a(Hash)

    expect(found_user[:data][:attributes]).to have_key(:email)
    expect(found_user[:data][:attributes][:email]).to eq(created_user.email)

    expect(found_user[:data][:attributes]).to have_key(:api_key)
    expect(found_user[:data][:attributes][:api_key]).to be_a(String)
    expect(found_user[:data][:attributes][:api_key]).to eq(created_user.api_key)
  end
end
