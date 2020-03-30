class OrderProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product
	enum production_status: {cannot_start: 0, waiting_production: 1, in_production: 2, completed_production: 3}
end
