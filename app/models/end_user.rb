class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
has_many :shipping_addresses
has_many :cart_products
has_many :orders

# ログインするときに退会済みユーザーを弾く
 # def active_for_authentication?
 #    super && (self.is_unsubscribed == false)
 #  end

 def EndUser.search(search, product_or_end_user)
   if product_or_end_user == "2"
    EndUser.where(["family_name LIKE? OR first_name LIKE?","%#{search}%","%#{search}%"])
   else
   	EndUser.all
   end
 end

end
