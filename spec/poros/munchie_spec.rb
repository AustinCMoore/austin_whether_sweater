require "rails_helper"

RSpec.describe Munchie do
  it "exists with attributes" do
    VCR.use_cassette('Restaurant Poro') do
      destination = 'pueblo,co'
      travel_time_in_seconds = 6528
      current_weather_data = {:dt=>1650907368,
                               :sunrise=>1650888535,
                               :sunset=>1650937412,
                               :temp=>47.66,
                               :feels_like=>43.43,
                               :pressure=>1027,
                               :humidity=>58,
                               :dew_point=>33.64,
                               :uvi=>6.03,
                               :clouds=>20,
                               :visibility=>10000,
                               :wind_speed=>9.22,
                               :wind_deg=>170,
                               :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}
      current_weather = CurrentForecast.new(current_weather_data)
      restaurant_data = RestaurantService.search_for_business('pueblo,co', '1650902087', 'chinese')
      restaurant = RestaurantPoro.new(restaurant_data)
      munchie = Munchie.new(destination, travel_time_in_seconds, current_weather, restaurant)

      expect(munchie).to be_instance_of(Munchie)
      expect(munchie.id).to eq(nil)
      expect(munchie.travel_time).to eq("1 hours 48 min")
      expect(munchie.forecast).to be_instance_of(CurrentForecast)
      expect(munchie.restaurant).to be_instance_of(RestaurantPoro)
      expect(munchie.destination_city).to eq("Pueblo, CO")
    end
  end
end
