class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_products
	enum payment_method: {credit_card: 0, Bank_transfer: 1}
	enum order_status: {waiting_payment: 0, }
end
