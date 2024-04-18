class Product < ApplicationRecord
  has_many :image_assignments
  has_many :product_images, through: :image_assignments
  has_many :catalog_sections
end
