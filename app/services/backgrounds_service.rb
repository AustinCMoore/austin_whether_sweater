class BackgroundsService
  def self.get_url(url, query, per_page, orientation, size, locale)
    conn = Faraday.new(url: "https://api.pexels.com") do |faraday|
      faraday.params[:query] = query
      faraday.params[:per_page] = per_page
      faraday.params[:orientation] = orientation
      faraday.params[:size] = size
      faraday.params[:locale] = locale
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_for_photo(location)
    get_url("/v1/search", location, "1", "landscape", "large", "en-US")
  end
end
