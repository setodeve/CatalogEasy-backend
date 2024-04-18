class AddUserIdToProductImages < ActiveRecord::Migration[7.0]
  def change
    add_column :product_images, :user_id, :bigint
    add_index :product_images, :user_id
    add_foreign_key :product_images, :users, column: :user_id 
  end
end
