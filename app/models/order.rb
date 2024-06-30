# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many :order_details, dependent: :destroy

  accepts_nested_attributes_for :user
end
