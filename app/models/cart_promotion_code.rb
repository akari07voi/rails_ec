# frozen_string_literal: true

class CartPromotionCode < ApplicationRecord
  belongs_to :cart
  belongs_to :promotion_code
  validates :promotion_code_id, uniqueness: { scope: :promotion_code }
end
