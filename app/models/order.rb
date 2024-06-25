class Order < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many :order_detail, dependent: :destroy

  accepts_nested_attributes_for :user
end
