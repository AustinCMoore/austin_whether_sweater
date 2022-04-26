class RoadtripSerializer
  include JSONAPI::Serializer
  attributes :id, :start_city, :end_city, :travel_time

  attributes :weather_at_eta do |roadtrip|
    {
      temperature: roadtrip.weather_at_eta.temperature,
      conditions: roadtrip.weather_at_eta.conditions
    }
  end
end
