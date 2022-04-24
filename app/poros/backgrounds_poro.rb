class BackgroundsPoro
  attr_reader :url,
              :photographer,
              :id

  def initialize(photo_data)
    @id = nil
    @url = photo_data[:photos][0][:url]
    @photographer = photo_data[:photos][0][:photographer]
  end
end
