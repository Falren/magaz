class ReviewsController < ApplicationController
  include Authorizable
  
  def create
    @review = Review.new(review_params)
    if @review.save
      flash.notice = 'Review has been successfully created'
    else
      flash.notice = 'Something went wrong'
    end
    redirect_to product_path(@review.product_id)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :user_id, :product_id)
  end
end
