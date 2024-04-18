class User < ApplicationRecord
  has_many :catalogs
  has_many :products
  has_many :product_images
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end