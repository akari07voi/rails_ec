# frozen_string_literal: true

class AddItemIdToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :item_id, :integer
  end
end
