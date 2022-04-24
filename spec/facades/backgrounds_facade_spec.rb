require 'rails_helper'

RSpec.describe 'The Backgrounds Facade' do
  it ".find_photo" do
    VCR.use_cassette('.find_photo') do
      photo = BackgroundsFacade.find_photo("denver,co")
      expect(photo).to be_instance_of(BackgroundsPoro)
    end
  end
end
