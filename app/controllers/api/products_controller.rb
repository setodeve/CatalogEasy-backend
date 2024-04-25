# frozen_string_literal: true

module Api
  class ProductsController < ApplicationController
    before_action :authenticate_api_user!, only: %i[index create]

    def index
      @products = Product.eager_load(:user).where(users: { id: current_api_user.id })
      render @products, formats: :json
    end

    def create
      ActiveRecord::Base.transaction do
        @products = product_params.map do |product_param|
          create_product_with_images(product_param) unless product_param[:image].nil?
        end

        @catalog = Catalog.new(name: 'カタログ', user_id: current_api_user.id)

        if @catalog.save
          @products.each do |product|
            create_product_and_section(@catalog, product) if !@catalog.nil? && !product.nil?
          end
        end

        render json: @products, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.message }, status: :unprocessable_entity
      end
    end

    private

    def create_product_and_section(catalog, product)
      CatalogSection.create(catalog_id: catalog.id, product_id: product.id, template_id: 1, page_number: 0, page_place_number: 0)
    end

    def product_params
      params.require(:products).map do |product|
        product.permit(:name, :size, :trade_price, :retail_price, :remark, :image, :product_image_id).merge(user_id: current_api_user.id)
      end
    end

    def create_product_with_images(params)
      product = build_product(params)
      return nil unless product&.save

      if params[:image].present? && params[:product_image_id].present?
        image_key = find_image_key(params)
        create_image_assignments(product, image_key) if image_key
      end

      product
    end

    def build_product(params)
      product_image_id = decrypt(params[:product_image_id])
      product_image = ProductImage.find_by(id: product_image_id)

      return nil unless product_image && image_matches?(product_image, params[:image])

      Product.new(params.except(:image, :product_image_id))
    end

    def image_matches?(product_image, image_url)
      product_image.image.all.any? { |image| url_for(image) == image_url }
    end

    def find_image_key(params)
      product_image_id = decrypt(params[:product_image_id])
      product_image = ProductImage.find_by(id: product_image_id)

      image = product_image.image.all.find { |img| url_for(img) == params[:image] }
      image&.key
    end

    def create_image_assignments(product, image_key)
      image_id = find_image_id_by_key(image_key)
      product.image_assignments.create!(product_id: product.id, product_image_id: image_id, image_key:) if image_id
    end

    def find_image_id_by_key(key)
      ActiveStorage::Blob.find_by(key:)&.attachments&.first&.record_id
    end
  end
end
