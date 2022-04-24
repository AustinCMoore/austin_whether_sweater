class BackgroundsFacade
  def self.find_photo(location)
    photo_data = BackgroundsService.search_for_photo(location)
    BackgroundsPoro.new(photo_data)
  end
end
