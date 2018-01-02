class Review < ApplicationRecord
	belongs_to :product 
	belongs_to :user
	validates_presence_of :body, :product_id, :rating
	validates_length_of  :body, within: 10...1000
end
