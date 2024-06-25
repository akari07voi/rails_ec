class ChangeDatacreditcardnumberToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :creditcardnumber, :string
  end
end
