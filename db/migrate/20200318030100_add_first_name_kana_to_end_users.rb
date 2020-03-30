class AddFirstNameKanaToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :first_name_kana, :string
  end
end
