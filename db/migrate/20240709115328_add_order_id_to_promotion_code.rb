# frozen_string_literal: true

class AddOrderIdToPromotionCode < ActiveRecord::Migration[7.0]
  def change
    add_column :promotion_codes, :order_id, :integer
  end
end
