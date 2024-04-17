class CreateImageAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :image_assignments do |t|
      t.references :product, null: false, foreign_key: true
      t.references :product_image, null: false, foreign_key: true
      t.string :image_key

      t.timestamps
    end
    add_index :image_assignments, [:product_id, :product_image_id, :image_key], unique: true, name: 'index_image_assignments_on_keys'
  end
end
