class ForecastService
  def self.get_url(url, latitude, longitude, excludes, units)
    conn = Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params[:appid] = ENV['openweather_api_key']
      faraday.params[:lat] = latitude
      faraday.params[:lon] = longitude
      faraday.params[:exclude] = excludes
      faraday.params[:units] = units
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_by_latlong(latitude, longitude)
    get_url("/data/2.5/onecall", latitude, longitude, "alerts,minutely", "imperial")
  end

  def self.get_by_hour(latitude, longitude)
    get_url("/data/2.5/onecall", latitude, longitude, "current,daily,alerts,minutely", "imperial")
  end
end
