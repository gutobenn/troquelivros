class AddAddressfieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :addr_street, :string
    add_column :users, :addr_number, :string
    add_column :users, :addr_complement, :string
    add_column :users, :addr_city, :string
    add_column :users, :phone, :string
  end
end
