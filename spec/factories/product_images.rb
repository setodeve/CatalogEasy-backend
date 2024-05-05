# frozen_string_literal: true

FactoryBot.define do
  factory :product_image do
    association :user

    after(:build) do |product_image|
      product_image.image.attach(
        io: File.open(Rails.root.join('spec', 'assets', 'catalogeasy.png')),
        filename: 'catalogeasy.png',
        content_type: 'image/png'
      )
    end
  end
end
