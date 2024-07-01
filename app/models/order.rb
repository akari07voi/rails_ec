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
end
