class ShippingAddress < ApplicationRecord
	belongs_to :end_user

	validates :name, :zip_code, :address, presence: true
end
