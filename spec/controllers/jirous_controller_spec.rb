require 'rails_helper'

RSpec.describe JirousController, type: :controller do
  let(:user) { create(:user) }
  describe "#shoplist" do
    before do
      user.confirmed_at = Time.zone.now
      user.save
      login_user user
    end
    it 'has a 200 status code post' do
      get :post
      expect(response).to have_http_status 200
    end
    it 'has a 200 status code shoplist' do
      get :shoplist
      expect(response).to have_http_status 200
    end

    it 'renders the :post template' do
      get :post
      expect(response).to render_template :post
    end
    it 'renders the :shoplist template' do
      get :shoplist
      expect(response).to render_template :shoplist
    end
  end
end
