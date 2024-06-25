class AddOrderIdToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :order_id, :integer
  end
end
