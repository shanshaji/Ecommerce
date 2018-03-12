class OrdersController < ApplicationController

	def index
		@orders=current_user.orders
	end


	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		@order.save
		redirect_to orders_path, notice: "sucessfully placed order"
	end

	private
	def order_params
		params[:order].permit(:address_id)
	end
end
