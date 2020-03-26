class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_products
	enum payment_method: {credit_card: 0, bank_transfer: 1}
	enum order_status: {waiting_payment: 0, payment_confirmation: 1, in_production: 2, preparing_shipment: 3, already_shipped: 4}

  def count
    sum = 0
    self.order_products.each do |order_product|
    sum +=  order_product.quantity
    end
  sum
  end

end
