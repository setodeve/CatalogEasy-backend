class ImageAssignment < ApplicationRecord
  belongs_to :product
  belongs_to :product_image

  validates :image_key, presence: true
end
