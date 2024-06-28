class RemoveOrderIdToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :order_id, :integer
  end
end
