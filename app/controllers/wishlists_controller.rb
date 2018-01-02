class WishlistsController < ApplicationController
	
	def create
		@wishlist = Wishlist.new(wishlist_params)
		@wishlist.user_id= current_user.id
		
		status = @wishlist.check_is_present
		if status 
			@wishlist.save
			redirect_to products_path, notice: "Sucessfully added the product to wishlist"
		else
			redirect_to products_path, notice: "Item already presents in wishlist"
		end

		# @wish_item = Wishlist.find_by(user_id: @wishlist.user_id, product_id: @wishlist.product_id)
		# if @wish_item.nil?
		# 	@wishlist.save
		# 	redirect_to products_path, notice: "Sucessfully added the product to wishlist"
		# else
		# 	redirect_to products_path, notice: "Item already presents in wishlist"
		# end
	end

	def index
		@wishlists = current_user.wishlists
	end

	def destroy
	@wishlist = Wishlist.find(params[:id])
  	@wishlist.destroy
  	redirect_to wishlists_path,notice: "Product was sucessfully removed from wishlist"
	end
	
	private

	def wishlist_params
		params[:wishlist].permit(:product_id)
	end
end
