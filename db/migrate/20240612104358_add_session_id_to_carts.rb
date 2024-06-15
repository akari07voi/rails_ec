class AddSessionIdToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :session_id, :string, null: false
  end
end
