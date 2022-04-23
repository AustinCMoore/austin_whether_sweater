require "rails_helper"

RSpec.describe HourlyForecast do
  it "exists with attributes" do
    forecast_data = {:dt=>1650736800,
                     :sunrise=>1650715839,
                     :sunset=>1650764727,
                     :moonrise=>1650703440,
                     :moonset=>1650737400,
                     :moon_phase=>0.75,
                     :temp=>{:day=>287.01, :min=>282.79, :max=>287.53, :night=>282.79, :eve=>286.83, :morn=>283.26},
                     :feels_like=>{:day=>284.95, :night=>280.21, :eve=>284.75, :morn=>281.03},
                     :pressure=>1001,
                     :humidity=>19,
                     :dew_point=>264.82,
                     :wind_speed=>7.41,
                     :wind_deg=>297,
                     :wind_gust=>13.96,
                     :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
                     :clouds=>95,
                     :pop=>0.16,
                     :uvi=>0}

    forecast = HourlyForecast.new(forecast_data)
    expect(forecast).to be_an_instance_of(HourlyForecast)

    expect(forecast.time).to be_an_instance_of(String)
    expect(forecast.time).to eq("14:00:00")

    expect(forecast.temperature).to be_an_instance_of(Float)
    expect(forecast.temperature).to eq(287.01)

    expect(forecast.conditions).to be_an_instance_of(String)
    expect(forecast.conditions).to eq("overcast clouds")

    expect(forecast.icon).to be_an_instance_of(String)
    expect(forecast.icon).to eq("04d")
  end
end
