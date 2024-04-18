class User < ApplicationRecord
  has_many :catalogs
  has_many :products
  has_many :product_images
end