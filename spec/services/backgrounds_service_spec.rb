require 'rails_helper'

RSpec.describe 'The Backgrounds Service' do
  it ".search_for_photo" do
    VCR.use_cassette('.search_for_photo') do
      background = BackgroundsService.search_for_photo("denver,co")
      expect(background).to be_instance_of(Hash)
    end
  end
end
