class Munchie
  attr_reader :id,
              :destination_city,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(destination, travel_time_in_seconds, current_weather, restaurant)
    @id = nil
    @destination = destination
    @travel_time_in_seconds = travel_time_in_seconds
    @forecast = current_weather
    @restaurant = restaurant
  end

  def destination_city
    split = @destination.split(',')
    city = split.first.capitalize
    state = split.last.upcase
    formatted_location = "#{city}, #{state}"
  end

  def travel_time
    hours = @travel_time_in_seconds / 3600
    minutes = (@travel_time_in_seconds / 60) % 60
    formatted_time = "#{hours.to_i} hours #{minutes.to_i} min"
  end
end
