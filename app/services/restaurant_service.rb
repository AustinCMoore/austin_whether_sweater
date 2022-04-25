class RestaurantService

  def self.get_url(url, location, arrival_time, term)
    conn = Faraday.new(url: "https://api.yelp.com") do |faraday|
      faraday.headers['Authorization'] = ENV['yelp_api_key']
      faraday.params['location'] = location
      faraday.params['open_at'] = arrival_time
      faraday.params['term'] = term
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_for_business(destination, arrival_time, food_type)
    get_url('/v3/businesses/search', destination, arrival_time, "#{food_type} restaurant")
  end
end
