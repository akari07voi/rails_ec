# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  has_one :cart_promotion_code, dependent: :destroy
  has_one :promotion_code, through: :cart_promotion_code
  def sum_price
    cart_items.inject(0) { |result, cart_item| result + cart_item.item.price }
  end
end
