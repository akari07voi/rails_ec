# frozen_string_literal: true

class AddSessionIdToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :session_id, :string
  end
end
