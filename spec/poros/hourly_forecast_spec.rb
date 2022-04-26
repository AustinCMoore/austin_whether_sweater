require "rails_helper"

RSpec.describe HourlyForecast do
  it "exists with attributes" do
    forecast_data = {
                    :dt=>1650841200,
                    :temp=>51.39,
                    :feels_like=>47.68,
                    :pressure=>1018,
                    :humidity=>31,
                    :dew_point=>22.95,
                    :uvi=>1.48,
                    :clouds=>100,
                    :visibility=>10000,
                    :wind_speed=>10,
                    :wind_deg=>47,
                    :wind_gust=>10.29,
                    :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]}

    forecast = HourlyForecast.new(forecast_data)
    expect(forecast).to be_an_instance_of(HourlyForecast)

    expect(forecast.time).to be_an_instance_of(String)
    expect(forecast.time).to eq("19:00:00")

    expect(forecast.temperature).to be_an_instance_of(Float)
    expect(forecast.temperature).to eq(51.39)

    expect(forecast.conditions).to be_an_instance_of(String)
    expect(forecast.conditions).to eq("overcast clouds")

    expect(forecast.icon).to be_an_instance_of(String)
    expect(forecast.icon).to eq("04d")
  end
end
