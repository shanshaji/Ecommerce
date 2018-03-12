class Role < ApplicationRecord
	has_many :permissions
	has_many :users, through: :permissions
	validates_presence_of :name
	validates_uniqueness_of :name
end
