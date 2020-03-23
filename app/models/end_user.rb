class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :shipping_addresses
has_many :cart_products
has_many :orders

# ログインするときに退会済みユーザーを弾く
 # def active_for_authentication?
 #    super && (self.is_unsubscribed == false)
 #  end


end
