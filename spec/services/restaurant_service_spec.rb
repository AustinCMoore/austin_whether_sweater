require 'rails_helper'

RSpec.describe 'The restaurant Service' do
  it ".search_for_business" do
    VCR.use_cassette('.search_for_business') do
      restaurant = RestaurantService.search_for_business('pueblo,co', '1650902087', 'chinese')
      expect(restaurant).to be_instance_of(Hash)
      expect(restaurant[:businesses].first).to have_key(:name)
      expect(restaurant[:businesses].first[:location]).to have_key(:display_address)
    end
  end
end
