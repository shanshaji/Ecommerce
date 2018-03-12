class Address < ApplicationRecord
	belongs_to :user
	has_many :orders
	validates_presence_of :name, :details, :street, :landmark, :state, :city, :pincode, :user_id
end
