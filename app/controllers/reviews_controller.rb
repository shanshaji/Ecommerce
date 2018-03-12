class ReviewsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource #invoke ability class 
	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		respond_to do |format|
			if @review.save
				format.js	
				format.html{redirect_to product_path(@review.product_id), notice: "Thank you for adding a review. "}
			else
				format.js
			end
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy 
		#redirect_to product_path(@review.product_id), notice: "You have successfully deleted the review"
	end

	private

	def review_params
		params[:review].permit(:body, :rating, :product_id, :user_id)
	end
end
