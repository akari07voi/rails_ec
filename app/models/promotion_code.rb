class PromotionCode < ApplicationRecord
  has_one :cart, through: :cart_promotion_code
  has_one :cart_promotion_code, dependent: :nullify
end
