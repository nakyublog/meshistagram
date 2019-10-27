require 'rails_helper'

RSpec.describe JirousController, type: :controller do
  describe "#show" do
    let(:taxon) { create(:taxon, taxonomy: taxonomy) }
    let(:taxonomy) { create(:taxonomy) }
    let(:product) { create(:product, taxons: [taxon]) }

    before { get :show, params: { id: taxon.id } }

    it 'assigns @taxon' do
      expect(assigns(:taxon)).to eq taxon
    end

    it 'assigns @taxonomies' do
      expect(assigns(:taxonomies)).to match_array(taxonomy)
    end

    it 'assigns @products' do
      expect(assigns(:products)).to match_array(product)
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status 200
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end
end
