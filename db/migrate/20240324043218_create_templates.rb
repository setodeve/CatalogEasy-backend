# frozen_string_literal: true

class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :content, null: false

      t.timestamps
    end
  end
end
