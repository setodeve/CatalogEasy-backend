# frozen_string_literal: true

user = User.create!(
  email: "test@example.com",
  password: "securepassword",
)

product = Product.create!(
  name: "テスト商品",
  size: "M",
  trade_price: 1500,
  retail_price: 3000,
  user_id: 1
)

catalog = Catalog.create!(
  name: "2024 春のカタログ",
  user_id: 1
)

Template.create!(
  content: "テストテンプレート"
)

catalog_section = CatalogSection.create!(
  template_id: 1,
  catalog_id: catalog.id,
  product_id: product.id,
  page_number: 1,
  page_place_number: 1
)

product_image = ProductImage.create!(
  user_id: 1
)

image_assignment = ImageAssignment.create!(
  product_id: product.id,
  product_image_id: product_image.id,
  image_key: "front_view"
)