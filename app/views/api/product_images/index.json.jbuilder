# frozen_string_literal: true

json.array! @product_images do |product_image|
  json.extract! product_image, :id, :created_at, :updated_at, :image_url
end
