class Wishlist < ApplicationRecord
	belongs_to :product
	belongs_to :user

	def check_is_present
		wishlist = Wishlist.find_by(user_id: self.user_id, product_id: self.product_id)
		return wishlist.nil? 

	end
end
