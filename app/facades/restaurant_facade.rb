class RestaurantFacade
  def self.get_restaurant(destination, arrival_time, food_type)
    restaurant_data = RestaurantService.search_for_business(destination, arrival_time, food_type)
    RestaurantPoro.new(restaurant_data)
  end
end
