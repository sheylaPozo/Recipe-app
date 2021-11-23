# frozen_string_literal: true

class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
