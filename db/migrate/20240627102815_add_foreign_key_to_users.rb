# frozen_string_literal: true

class AddForeignKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :order, foreign_key: true
  end
end
