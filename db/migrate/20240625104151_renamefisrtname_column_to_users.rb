class RenamefisrtnameColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :fisrtname, :firstname
  end
end
