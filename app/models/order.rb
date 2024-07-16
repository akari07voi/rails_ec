# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many :order_details, dependent: :destroy

  accepts_nested_attributes_for :user

  def sum_price
    order_details.inject(0) { |result, item| result + item.quantity * item.price }
  end

  def sum_quantity
    order_details.inject(0) { |result, item| result + item.quantity }
  end

  def bought_items(cart)
    bought_items_counts = cart.cart_items.group(:item_id).count
    bought_items_details = Item.where(id: bought_items_counts.keys)
    bought_items_details.map do |bought_item_detail|
      order_details.build(
        order_id: id,
        name: bought_item_detail.name,
        price: bought_item_detail.price,
        quantity: bought_items_counts[bought_item_detail.id]
      )
    end
  end
end
