class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_admin

  def index
    @products = Product.all
  end

  def show
    @product = Product.friendly.find(params[:id])
    @wish_lists = WishList.all
    @wish_list_item = WishListItem.new(product_id: @product.id)
    @line_item = current_user.drafted_order&.line_items&.find_by(product_id: @product.id) || LineItem.new(product_id: @product.id)
    @review = Review.new(product_id: @product.id, user_id: current_user.id)
    @reviews = @product.reviews
    @bought_product = current_user.line_items.find_by(product_id: @product.id, orders: { status: :completed })
  end

  def new
    @product = Product.new
    @category = Category.find(params[:category_id])
  end

  def create
    @product = Product.new(product_params)
    @category = @product.category
    if @product.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def edit
    @product = Product.friendly.find(params[:id])
    @order = Order.find(params[:id])
  end

  def update
    @product = Product.friendly.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.friendly.find(params[:id])
    if @product.destroy
      redirect_to products_path, notice: "#{@product.name} has been successfully deleted."
    else
      flash[:notice] = 'Ooops. Something went wrong. Try later'
      render 'show'
    end
  end

  private

  def product_params
    params.require(:product).permit(:status, :quantity, :name, :price, :category_id, :main_image, images: [])
  end

  def authorize_admin
    authorize(:product)
  end
end
