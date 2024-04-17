class RemoveImageIdProducts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :products, :product_images
    remove_index :products, :product_image_id
    remove_column :products, :product_image_id, :bigint
  end
end
