class CreateOrderUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :order_users do |t|

      t.timestamps
    end
  end
end
