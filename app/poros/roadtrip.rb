class Roadtrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(start_city, end_city, travel_time, weather_at_eta)
    @id = nil
    @start_city = start_city
    @end_city = end_city
    @travel_time_in_seconds = travel_time
    @weather_at_eta = weather_at_eta
  end

  def travel_time
     hours = @travel_time_in_seconds / 3600
     minutes = (@travel_time_in_seconds / 60) % 60
     formatted_time = "#{hours.to_i} hours #{minutes.to_i} min"
   end
end
