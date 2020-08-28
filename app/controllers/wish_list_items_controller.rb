class WishListItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    @wish_list_item = WishListItem.new(wish_list_item_params)
    if @wish_list_item.save
      redirect_to wish_list_path(@wish_list_item.wish_list_id)
    else
      @product = @wish_list_item.product
      render 'products/show'
    end
  end

  def destroy
  @wish_list_item = WishListItem.find(params[:id])
    if @wish_list_item.destroy
      redirect_to wish_list_path(@wish_list_item.wish_list_id)
    else
      render 'wish_lists/show'
    end
  end

  private

  def wish_list_item_params
    params.require(:wish_list_item).permit(:product_id, :wish_list_id)
  end
end
