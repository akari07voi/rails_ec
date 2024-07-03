# frozen_string_literal: true

class AddOrderIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :order_id, :integer, foreign_key: true
  end
end
