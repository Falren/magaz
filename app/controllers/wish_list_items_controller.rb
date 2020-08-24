class WishListItemsController < ApplicationController
  def create
    @wish_list_item = WishListItem.new(wish_list_item_params)
    @wish_list = @wish_list_item.wish_list_id
    if @wish_list_item.save
      redirect_to wish_list_path(@wish_list)
    else
      render 'products/show'
    end
  end

  private

  def wish_list_item_params
    params.require(:wish_list_item).permit(:product_id, :wish_list_id)
  end
end
