# frozen_string_literal: true

User.create!(
  email: 'test@example.com',
  password: 'securepassword'
)

product = Product.create!(
  name: 'テスト商品',
  size: 'M',
  trade_price: 1500,
  retail_price: 3000,
  user_id: 1
)

catalog = Catalog.create!(
  name: 'カタログ',
  user_id: 1
)

Template.create!(
  content: 'テストテンプレート'
)

CatalogSection.create!(
  template_id: 1,
  catalog_id: catalog.id,
  product_id: product.id,
  page_number: 1,
  page_place_number: 1
)

product_image = ProductImage.create!(
  user_id: 1
)

ImageAssignment.create!(
  product_id: product.id,
  product_image_id: product_image.id,
  image_key: 'front_view'
)
