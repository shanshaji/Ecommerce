class CategoriesController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource #invoke ability class 

	def index
		@categories = Category.all

	end

	def show
		@category = Category.find(params[:id])
	end
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path(:category_id), notice: "The category is sucessfully created"
		else
			render action: 'new'
		end
	end

	private

	def category_params
		params[:category].permit(:id,:name,:parent_id)
	end

end
