# frozen_string_literal: true

json.array! @products do |product|
  json.extract! product, :id, :name, :size, :trade_price, :retail_price, :remark, :image_url, :created_at, :updated_at
end
