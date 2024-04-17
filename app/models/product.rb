class Product < ApplicationRecord
  has_one :product_image
  has_many :catalog_sections
end
