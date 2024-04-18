class AddUserIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :user_id, :bigint
    add_index :products, :user_id
    add_foreign_key :products, :users, column: :user_id 
  end
end
