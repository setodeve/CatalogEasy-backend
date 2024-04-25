# frozen_string_literal: true

class CatalogSection < ApplicationRecord
  belongs_to :catalog
  belongs_to :product
  belongs_to :template
end
