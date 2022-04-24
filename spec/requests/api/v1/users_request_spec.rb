require 'rails_helper'

RSpec.describe 'Users request' do
  it "Creates a user with proper information" do
    user_count = User.all.count
    post "/api/v1/users", :params => {
                                      :email => "whatever@example.com",
                                      :password => "password",
                                      :password_confirmation => "password"
                                      }
    expect(response).to be_successful
    user = JSON.parse(response.body, symbolize_names: true)
    expect(user).to have_key(:data)

    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_an(String)

    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq("users")

    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)

    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)

    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to eq("whatever@example.com")

    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)

    expect(User.all.count).to eq(user_count += 1)
  end
end
