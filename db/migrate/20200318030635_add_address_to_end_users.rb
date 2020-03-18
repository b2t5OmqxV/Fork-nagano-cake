class AddAddressToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :address, :string
  end
end
