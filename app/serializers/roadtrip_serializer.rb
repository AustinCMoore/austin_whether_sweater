class RoadtripSerializer
  include JSONAPI::Serializer
  attributes :id, :start_city, :end_city, :travel_time

  attributes :weather_at_eta, if: Proc.new { |roadtrip|
    roadtrip.weather_at_eta.present?
    } do |roadtrip|
    {
      temperature: roadtrip.weather_at_eta.temperature,
      conditions: roadtrip.weather_at_eta.conditions
    }
  end
end
