class RemoveSessionIdToCarts < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :session_id, :integer
  end
end
