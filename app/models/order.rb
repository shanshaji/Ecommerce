class Order < ApplicationRecord
	has_many :order_line_items
	belongs_to :user
	belongs_to :address

	before_validation :set_number_date_total
	after_create :move_to_order_line_items
	after_create :empty_cart_line_items
	after_create :update_stock
	after_create :send_order_confirmation

	validates_presence_of :order_number, :order_date, :user_id, :total, :address_id

	def set_number_date_total
		self.order_number = "DCT-#{Random.rand(1000)}"
		self.order_date = Date.today
		self.total = calculate_total
	end

	def calculate_total
		total = 0
		self.user.cart_line_items.each do |line_item|
			total += (line_item.quantity * line_item.product.price)
			
		end
		return total
	end

	def move_to_order_line_items
		self.user.cart_line_items.each do |line_item|
			OrderLineItem.create(product_id: line_item.product_id, quantity: line_item.quantity, price: line_item.product.price, order_id: self.id)
		end

	end

	def empty_cart_line_items
		CartLineItem.delete(self.user.cart_line_items.pluck(:id))
	end

	def update_stock
		self.order_line_items.each do |line_item|
			line_item.product.update_attributes(stock: line_item.product.stock - line_item.quantity)
			
		end
	end

	def send_order_confirmation
		NotificationMailer.order_confirmation(self).deliver!
	end
end

