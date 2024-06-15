# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :nullify
  has_many :items, through: :cart_items
end
