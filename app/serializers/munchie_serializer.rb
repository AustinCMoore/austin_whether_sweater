class MunchieSerializer
  include JSONAPI::Serializer
  attributes :destination_city, :travel_time

  attributes :forecast do |munchie|
    {
      temperature: munchie.forecast.temperature.to_s,
      summary: munchie.forecast.conditions
    }
  end

  attribute :restaurant do |munchie|
    {
      name: munchie.restaurant.name,
      address: munchie.restaurant.address
    }
  end
end
