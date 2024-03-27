# frozen_string_literal: true

class CreateCatalogSections < ActiveRecord::Migration[7.0]
  def change
    create_table :catalog_sections do |t|
      t.references :template, foreign_key: true, null: false
      t.references :catalog, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.bigint :page_number, null: false
      t.bigint :page_place_number, null: false

      t.timestamps
    end
  end
end
