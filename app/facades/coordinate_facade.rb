class CoordinateFacade
  def self.find_coordinate(location)
    coordinate_data = CoordinateService.search_for_location(location)
    CoordinatePoro.new(coordinate_data)
  end

  def self.find_time(start, destination)
    time = CoordinateService.get_time_between(start, destination)
    return time[:route][:realTime]
  end
end
