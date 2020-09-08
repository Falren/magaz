class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
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

  def authorize_admin
    authorize(:review)
  end

  def review_params
    params.require(:review).permit(:body, :rating, :user_id, :product_id)
  end
end
