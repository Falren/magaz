class WishListsController < ApplicationController
  include Authorizable
  def new
    @wish_list = WishList.new
  end

  def create
    @wish_list = WishList.new(wish_list_params)
    if @wish_list.save
      redirect_to product_path(params[:product_id])
    else
      render 'wish_lists/new'
    end
  end

  def show
    @wish_list = WishList.find(params[:id])
    @wish_list_items = @wish_list.wish_list_items
  end

  def index
    @wish_lists = current_user.wish_lists
  end

  def destroy
    @wish_list = WishList.find(params[:id])
    if @wish_list.destroy
      redirect_to wish_lists_path
    else
      render 'show'
    end
  end

  private

  def wish_list_params
    params.require(:wish_list).permit(:user_id, :name, :note)
  end
end
