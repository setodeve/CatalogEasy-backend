class ImageAssignment < ApplicationRecord
  belongs_to :product
  belongs_to :product_image

  validates :product_image_id, presence: true
  validates :image_key, presence: true
end
