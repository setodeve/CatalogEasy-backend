# frozen_string_literal: true

class ProductImage < ApplicationRecord
  has_many_attached :image
end
