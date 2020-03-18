class AddIsUnsubscribedToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :is_unsubscribed, :boolean
  end
end
