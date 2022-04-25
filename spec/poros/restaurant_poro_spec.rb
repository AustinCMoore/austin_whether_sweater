require "rails_helper"

RSpec.describe RestaurantPoro do
  it "exists with attributes" do
    VCR.use_cassette('Restaurant Poro') do
      restaurant_data = RestaurantService.search_for_business('pueblo,co', '1650902087', 'chinese')
      restaurant = RestaurantPoro.new(restaurant_data)

      expect(restaurant).to be_instance_of(RestaurantPoro)
      expect(restaurant.name).to eq("Panda Express")
      expect(restaurant.address).to eq("2001 S. Pueblo Blvd.")
    end
  end
end
