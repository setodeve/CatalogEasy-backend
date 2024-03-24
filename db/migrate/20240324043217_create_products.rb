class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :size, null: false
      t.bigint :tradePrice
      t.bigint :retailPrice
      t.string :remark
      t.references :image, foreign_key: true, null: false

      t.timestamps
    end
  end
end
