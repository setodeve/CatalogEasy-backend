class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index, formats: :json
  end

  def create
    ActiveRecord::Base.transaction do
      @products = product_params.map do |product_param|
        product = build_product(product_param)
        if product&.save
          create_image_assignments(product, product_param[:image_key]) if product_param[:image_key].present?
        end
        product
      end
      render json: @products, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.message }, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:products).map { |product| product.permit(:name, :size, :trade_price, :retail_price, :remark, :image, :product_image_id) }
  end

  def build_product(params)
    tmp = image_exist?(params)
    return nil unless tmp[:product_image_id].present?
    Product.new(tmp.except(:image, :image_key, :product_image_id))
  end

  def image_exist?(params)
    product_image_id = decrypt(params[:product_image_id])
    product_image = ProductImage.find_by(id: product_image_id)

    if product_image && image_matches?(product_image, params[:image])
      params.merge!(product_image_id: product_image_id, image_key: find_image_key(params[:image]))
    else
      params.merge!(product_image_id: nil, image_key: nil)
    end
  end

  def image_matches?(product_image, image_url)
    product_image.image.all.any? { |image| url_for(image) == image_url }
  end

  def find_image_key(image_url)
    ActiveStorage::Attachment.find_by(blob: ActiveStorage::Blob.find_signed(image_url))&.blob&.key
  end

  def create_image_assignments(product, image_key)
    product.image_assignments.create!(product_image_id: find_image_id_by_key(image_key), image_key: image_key)
  end

  def find_image_id_by_key(key)
    ActiveStorage::Blob.find_by(key: key)&.attachments.first&.record_id
  end

end
