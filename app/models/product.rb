class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_products
	has_many :order_products

	attachment :image

	def Product.search(search, product_or_end_user)
    if product_or_end_user == "1"
      Product.where(["name LIKE ?","%#{search}%"])
    else
      Product.all
    end
  end

  validates :name, :description, :price, :image,  presence: true
end
