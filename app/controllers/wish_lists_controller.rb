class WishListsController < ApplicationController
  def new
    @wishlist = WishList.new
  end

  def create
    @wishlist = WishList.new
    @product = Product.friendly.find(params(:id)
    if @wishlist.save(wishlist_params)
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end
end
