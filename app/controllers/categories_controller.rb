class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  def show
    @category = Category.friendly.find(params[:id])
    @products = Product.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render 'home/index'
    end
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @category.update(category_params)
      redirect_to root_path
    else
      render 'home/index'
    end

  end

  def destroy
    @category = Category.friendly.find(params[:id])
    if @category.destroy
      redirect_to root_path
    else
      render 'home/index'
    end
  end

  private

  def authorize_admin
    authorize(:category)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
