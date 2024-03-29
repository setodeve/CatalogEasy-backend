# frozen_string_literal: true

class ProductImage < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many_attached :image

  def image_url
    return nil unless image.attached?

    urls = []
    image.each do |i|
      urls << url_for(i)
    end
    urls
  end
end
