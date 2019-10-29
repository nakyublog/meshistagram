require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:micropost) { create(:micropost, user: user) }
  let(:user) { create(:user) }
  let(:users) { create_list(:user, 5) }
  describe "#show" do
    before do
      user.confirmed_at = Time.zone.now
      user.save
      login_user user
    end
    it 'has a 200 status code show' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status 200
    end
    it 'has a 200 status code index' do
      get :index
      expect(response).to have_http_status 200
    end

    it 'renders the :show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template :show
      expect(assigns(:user)).to eq user
    end
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
      expect(assigns(:users)).to match_array(user)
    end
  end
end
