require 'rails_helper'

RSpec.feature "MapAWalks", type: :feature do
  describe 'map a walk' do
    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit new_walk_path
    end
    it 'records start address and end address' do
      fill_in 'walk[start_location_attributes][address]', with: '800 Brazos st, Austin, Tx'
      fill_in 'walk[end_location_attributes][address]', with: '200 Guadalupe st, Austin, Tx'
      click_on "Walk!"
      expect(Walk.all.count).to eq(1)
      expect(Walk.last.start_location.address).to eq('800 Brazos st, Austin, Tx')
      expect(Walk.last.start_location.latitude).not_to be_nil
      expect(Walk.last.end_location.address).to eq('200 Guadalupe st, Austin, Tx')
    end

    it "get an address with the current location", :js => true do
      click_on "Use Current Location"
      expect(page).to have_css("start_lat", value: 22)
    end
  end
end
