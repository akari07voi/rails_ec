# frozen_string_literal: true

class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.string :name
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
