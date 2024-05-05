# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ProductImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:product_image) { create(:product_image, user:) }

  before do
    allow(controller).to receive(:authenticate_api_user!).and_return(true)
    allow(controller).to receive(:current_api_user).and_return(user)
  end

  describe 'GET #index' do
    before do
      create_list(:product_image, 3, user:)
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:image_file) { fixture_file_upload(Rails.root.join('spec', 'assets', 'catalogeasy.png'), 'catalogeasy.png') }

    it 'creates a new product image' do
      expect do
        post :create, params: { image: [image_file] }
      end.to change(ProductImage, :count).by(1)
    end

    it 'returns http success' do
      post :create, params: { image: [image_file] }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the product image' do
      delete :destroy, params: { id: product_image.id }
      expect(ProductImage.find_by(id: product_image.id)).to be_nil
    end

    it 'returns http success' do
      delete :destroy, params: { id: product_image.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
