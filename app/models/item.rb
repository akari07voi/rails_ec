# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :description, presence: true
end
