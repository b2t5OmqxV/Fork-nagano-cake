class AddZipCodeToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :zip_code, :string
  end
end
