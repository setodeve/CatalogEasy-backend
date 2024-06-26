# frozen_string_literal: true

class ProductImage < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_many_attached :image
  has_many :image_assignments
  has_many :products, through: :image_assignments
  def image_url
    return nil unless image.attached?

    urls = []
    image.each do |i|
      puts "image: #{i}"
      urls << rails_blob_url(i)
    end
    urls
  end
end
