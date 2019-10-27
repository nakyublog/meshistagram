require 'rails_helper'

RSpec.feature 'home', type: :feature do
  let(:user) { create(:user) }
  let(:jirou) { create(:jirou, user: user) }
  let(:micropost) { create(:micropost) }

  background do
    visit potepan_category_path(id: taxon.id)
  end

  scenario 'User visits product detail page' do
    expect(page).to have_link product.name
    click_on product.name
    expect(current_path).to eq potepan_product_path(product.id)
  end

  scenario 'Expected information is displayed on the category page' do
    within '.productBox' do
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
    end
  end
end