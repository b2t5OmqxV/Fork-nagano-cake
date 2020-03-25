class AddDeviseCreateToEndUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column  :end_users,  :confirmation_token,  :string
    add_column  :end_users,  :confirmed_at,        :datetime
    add_column  :end_users,  :confirmation_sent_at,:datetime    
    add_column  :end_users,  :unconfirmed_email,   :string 
  end
end
