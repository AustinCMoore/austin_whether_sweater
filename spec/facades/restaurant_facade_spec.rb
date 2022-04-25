require 'rails_helper'

RSpec.describe 'The Restaurant Facade' do
  it ".get_restaurant" do
    VCR.use_cassette('.get_restaurant') do
      restaurant = RestaurantFacade.get_restaurant('pueblo,co', '1650902087', 'chinese')
      expect(restaurant).to be_instance_of(RestaurantPoro)
    end
  end
end
