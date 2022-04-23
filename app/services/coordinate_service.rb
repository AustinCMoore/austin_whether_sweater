class CoordinateService
  def self.get_url(url, location)
    conn = Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params[:key] = ENV['mapquest_api_key']
      faraday.params[:location] = "#{location}"
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_for_location(location)
    get_url("/geocoding/v1/address", location)
  end
end
