# frozen_string_literal: true

class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_codes do |t|
      t.string :code
      t.datetime :used_at
      t.integer :educed_price

      t.timestamps
    end
  end
end
