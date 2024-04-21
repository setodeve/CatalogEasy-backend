class Catalog < ApplicationRecord
  belongs_to :user
  has_many :catalog_sections
  has_many :products, through: :catalog_sections
end