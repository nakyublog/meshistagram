require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:micropost) { create(:micropost, user: user) }
  let(:user) { create(:user) }
  let(:jirou) { create(:jirou, user: user) }
  describe "#index" do
    before do
      user.confirmed_at = Time.zone.now
      user.save
      login_user user
    end
    it 'has a 200 status code index' do
      get :index
      expect(response).to have_http_status 200
    end
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
      expect(assigns(:jirou)).to match_array(jirou)
    end
  end
end
