# frozen_string_literal: true

module Api
  class CatalogsController < ApplicationController
    before_action :authenticate_api_user!, only: %i[index create update show]
    def index
      tmp = Catalog.eager_load(:user).where(users: { id: current_api_user.id })
      @catalogs = {}
      tmp.each do |t|
        id = encrypt(t.id)
        @catalogs[id] = t
      end
      render json: @catalogs
    end

    def update 
      @catalog = Catalog.find((params[:id]))
      if @catalog.update(catalog_params)
        render json: @catalog, status: :ok
      else
        render json: @catalog.errors, status: :unprocessable_entity
      end
    end

    def create; end

    def show
      tmp = Catalog.find(decrypt(params[:id]))
      return render json: { 'products' => [] } if tmp.user_id != current_api_user.id

      @catalog = []
      tmp.products.each do |t|
        image_key = t.image_assignments.first.image_key
        image_url = url_for(ActiveStorage::Blob.find_by(key: image_key))
        @catalog << t.as_json.merge(image: image_url)
      end
      render json: @catalog
    end

  private
    def catalog_params
      params.require(:catalog).permit(:id, :name)
    end
  end
end
