class Product < ApplicationRecord
	belongs_to :category
	has_many :reviews
	has_many :cart_line_items
	has_many :wishlists
	has_many :order_line_items
	
	validates_presence_of :name, :price, :description, :category_id, :stock
	validates_numericality_of :price, greater_than: 0
	validates_numericality_of :stock, greater_than_or_equal_to: 0
	validates_length_of :description, minimum: 5
	mount_uploader :cover, CoverUploader
	
end
