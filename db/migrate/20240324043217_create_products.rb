# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :size, null: false
      t.bigint :trade_price
      t.bigint :retail_price
      t.string :remark
      t.references :product_image, foreign_key: true

      t.timestamps
    end
  end
end
