class CoordinateService
  def self.get_url(url, location = nil, from = nil, to = nil)
    conn = Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params[:key] = ENV['mapquest_api_key']
      faraday.params[:location] = location unless location == nil
      faraday.params[:from] = from unless from == nil
      faraday.params[:to] = to unless to == nil
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_for_location(location)
    get_url("/geocoding/v1/address", location)
  end

  def self.get_time_between(start, destination)
    get_url("/directions/v2/route", nil, start, destination)
  end
end
