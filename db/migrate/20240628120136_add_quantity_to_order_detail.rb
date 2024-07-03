# frozen_string_literal: true

class AddQuantityToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :quantity, :integer
  end
end
