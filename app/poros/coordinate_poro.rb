class CoordinatePoro
  attr_reader :latitude,
              :longitude

  def initialize(coordinate_data)
    @latitude = coordinate_data[:results].first[:locations].first[:latLng][:lat]
    @longitude = coordinate_data[:results].first[:locations].first[:latLng][:lng]
  end
end
