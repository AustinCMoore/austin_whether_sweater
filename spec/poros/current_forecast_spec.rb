require "rails_helper"

RSpec.describe CurrentForecast do
  it "exists with attributes" do
    forecast_data = {:dt=>1650745867,
                     :sunrise=>1650715839,
                     :sunset=>1650764727,
                     :temp=>287.48,
                     :feels_like=>285.54,
                     :pressure=>1002,
                     :humidity=>22,
                     :dew_point=>266.85,
                     :uvi=>0,
                     :clouds=>91,
                     :visibility=>10000,
                     :wind_speed=>5.81,
                     :wind_deg=>347,
                     :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]}

    forecast = CurrentForecast.new(forecast_data)
    expect(forecast).to be_an_instance_of(CurrentForecast)

    expect(forecast.datetime).to be_an_instance_of(String)
    expect(forecast.datetime).to eq("2022-04-23 16:31:07 -0400")

    expect(forecast.sunrise).to be_an_instance_of(String)
    expect(forecast.sunrise).to eq("2022-04-23 08:10:39 -0400")

    expect(forecast.sunset).to be_an_instance_of(String)
    expect(forecast.sunset).to eq("2022-04-23 21:45:27 -0400")

    expect(forecast.temperature).to be_an_instance_of(Float)
    expect(forecast.temperature).to eq(287.48)

    expect(forecast.feels_like).to be_an_instance_of(Float)
    expect(forecast.feels_like).to eq(285.54)

    expect(forecast.humidity).to be_an_instance_of(Float)
    expect(forecast.humidity).to eq(22)

    expect(forecast.uvi).to be_an_instance_of(Float)
    expect(forecast.uvi).to eq(0)

    expect(forecast.visibility).to be_an_instance_of(Float)
    expect(forecast.visibility).to eq(10000)

    expect(forecast.conditions).to be_an_instance_of(String)
    expect(forecast.conditions).to eq("overcast clouds")

    expect(forecast.icon).to be_an_instance_of(String)
    expect(forecast.icon).to eq("04d")
  end
end
