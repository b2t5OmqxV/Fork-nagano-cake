class AddPhoneNumberToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :phone_number, :string
  end
end
