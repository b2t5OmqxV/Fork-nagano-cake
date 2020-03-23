class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_products
	enum payment_method: {credit_card: 0, Bank_transfer: 1}
  
	enum order_status: {waiting_payment: 0, payment_confirmation: 1, in_production: 2, 
preparing_shipment: 3, already_shipped: 4}

end
