require "rails_helper"

RSpec.describe BackgroundsPoro do
  it "exists with attributes" do
    photo_data = {:page=>1,
                   :per_page=>1,
                   :photos=>
                    [{:id=>8867237,
                      :width=>6000,
                      :height=>4000,
                      :url=>"https://www.pexels.com/photo/woman-in-black-blazer-wearing-a-headset-8867237/",
                      :photographer=>"Yan Krukov",
                      :photographer_url=>"https://www.pexels.com/@yankrukov",
                      :photographer_id=>2905570,
                      :avg_color=>"#868583",
                      :src=>
                       {:original=>"https://images.pexels.com/photos/8867237/pexels-photo-8867237.jpeg",
                        :large2x=>"https://images.pexels.com/photos/8867237/pexels-photo-8867237.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                        :large=>"https://images.pexels.com/photos/8867237/pexels-photo-8867237.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                        :medium=>"https://images.pexels.com/photos/8867237/pexels-photo-8867237.jpeg?auto=compress&cs=tinysrgb&h=350",
                        :small=>"https://images.pexels.com/photos/8867237/pexels-photo-8867237.jpeg?auto=compress&cs=tinysrgb&h=130",
                        :portrait=>"https://images.pexels.com/photos/8867237/pexels-photo-8867237.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                        :landscape=>"https://images.pexels.com/photos/8867237/pexels-photo-8867237.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                        :tiny=>"https://images.pexels.com/photos/8867237/pexels-photo-8867237.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"},
                      :alt=>"Free stock photo of adult, business, call center"}],
                   :total_results=>525,
                   :next_page=>"https://api.pexels.com/v1/search/?locale=en-US&orientation=landscape&page=2&per_page=1&query=denver%2Cco&size=large"}

    background = BackgroundsPoro.new(photo_data)
    expect(background).to be_an_instance_of(BackgroundsPoro)

    expect(background.id).to eq(nil)

    expect(background.url).to be_an_instance_of(String)
    expect(background.url).to eq("https://www.pexels.com/photo/woman-in-black-blazer-wearing-a-headset-8867237/")

    expect(background.photographer).to be_an_instance_of(String)
    expect(background.photographer).to eq("Yan Krukov")
  end
end
