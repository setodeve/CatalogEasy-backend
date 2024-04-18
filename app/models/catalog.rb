class Catalog < ApplicationRecord
  belongs_to :user
  has_many :catalog_sections
end