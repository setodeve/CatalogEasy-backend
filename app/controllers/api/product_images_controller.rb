# frozen_string_literal: true

module Api
  class ProductImagesController < ApplicationController
    before_action :authenticate_api_user!, only: %i[index create]

    def index
      @product_images = ProductImage.eager_load(:user, :image_attachments).where(users: { id: current_api_user.id })
      image_url = {}
      @product_images.each do |product_image|
        if product_image.image_url.present?
          id = encrypt(product_image.id)
          image_url[id] = product_image.image_url
        end
      end
      render json: image_url, status: :ok
    end

    def create
      @product_image = ProductImage.new(user_id: current_api_user.id)
      images = params[:image]
      images&.each do |image|
        @product_image.image.attach(image)
      end

      if @product_image.save
        render json: @product_image, status: :ok
      else
        render json: @product_image.errors, status: :unprocessable_entity
      end
    end

    def destroy
      # ProductImage.first.image.find(1).purge
      @product_image = ProductImage.find(params[:id])
      @product_image.destroy!
      render json: @product_image, status: :ok
    end

    private

    def product_images_params
      params.permit(:user_id)
    end
  end
end
