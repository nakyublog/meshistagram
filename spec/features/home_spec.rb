require 'rails_helper'

RSpec.feature 'home', type: :feature do
  let(:user) { create(:user) }
  let(:jirou) { create(:jirou, user: user) }
  let(:micropost) { create(:micropost) }
  before do
      user.confirmed_at = Time.zone.now
      user.save
      login_user user
  end
  background do
    
    visit root_path
  end

  scenario 'User visits home page' do
    expect(page).to have_link user.jirou
    expect(current_path).to eq root_path
  end

  scenario 'Expected jirou is displayed on the home page' do
    within '.mymeshi' do
      expect(page).to have_content jirou.name
      expect(page).to have_content jirou.url
    end
  end
end