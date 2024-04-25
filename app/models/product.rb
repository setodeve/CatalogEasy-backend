# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :image_assignments
  has_many :product_images, through: :image_assignments
  has_many :catalog_sections
  has_many :catalogs, through: :catalog_sections
  belongs_to :user
end
