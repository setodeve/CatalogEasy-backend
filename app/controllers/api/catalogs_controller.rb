# frozen_string_literal: true

module Api
  class CatalogsController < ApplicationController
    before_action :authenticate_api_user!, only: %i[index create show]
    def index
      tmp = Catalog.eager_load(:user).where(users: { id: current_api_user.id })
      @catalogs = {}
      tmp.each do |t|
        id = encrypt(t.id)
        @catalogs[id] = t
      end
      render json: @catalogs
    end

    def create; end

    def show
      catalog_id = decrypt(params[:id])
      user_id = current_api_user.id
    
      tmp = Catalog.eager_load(
        :user,
        products: {
          image_assignments: {
            product_image: { image_attachments: :blob }
          }
        }
      ).where(id: catalog_id, users: { id: user_id }).load.first
    
      return render json: { 'products' => [] } if tmp.nil?
    
      @catalog = tmp.products.map do |product|
        image_assignment = product.image_assignments.first
        image_url = image_assignment&.product_image&.image&.any? ? url_for(image_assignment.product_image.image.first) : nil
        product.as_json.merge(image: image_url)
      end
      render json: @catalog
    end    
  end
end
