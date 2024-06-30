# frozen_string_literal: true

class ChangeDatacreditcardnumberToUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :creditcardnumber, :string
  end
end
