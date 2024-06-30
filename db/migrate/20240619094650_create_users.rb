# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fisrtname
      t.string :lastname
      t.string :username
      t.string :email
      t.string :country
      t.string :state
      t.integer :zip
      t.string :address
      t.string :address2
      t.string :cardname
      t.integer :creditcardnumber
      t.datetime :expiration
      t.integer :cvv

      t.timestamps
    end
  end
end
