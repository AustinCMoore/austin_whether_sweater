class CoordinateFacade
  def self.find_coordinate(location)
    coordinate_data = CoordinateService.search_for_location(location)
    CoordinatePoro.new(coordinate_data)
  end
end
