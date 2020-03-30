class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :address
      t.string :zip_code
      t.string :name
      t.integer :payment_method
      t.integer :total_fee
      t.integer :postage, default: 800
      t.integer :order_status

      t.timestamps
    end
  end
end
