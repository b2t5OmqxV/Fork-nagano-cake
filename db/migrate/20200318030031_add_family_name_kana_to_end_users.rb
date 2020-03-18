class AddFamilyNameKanaToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :family_name_kana, :string
  end
end
