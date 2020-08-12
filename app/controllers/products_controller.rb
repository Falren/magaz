class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.friendly.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path(@product)
    else
      render 'new'
    end
  end
  def edit
    @product = Product.friendly.find(params[:id])
  end

  def update
    @product = Product.friendly.find(params[:id])
    if @product.upadte(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.friendly.find(params[:id])
    if @product.destroy
      redirect_to products_path
    else
      render 'show'
    end
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
