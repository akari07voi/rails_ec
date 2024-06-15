class AddItemIdToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :item_id, :integer, null: false
  end
end
