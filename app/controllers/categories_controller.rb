class CategoriesController < ApplicationController
  include Authorizable

  def show
    @category = Category.friendly.find(params[:id])
    @products = current_user.admin? ? Product.all.order(:status) : Product.all.products_for_users.order(:status)
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

  def category_params
    params.require(:category).permit(:name)
  end
end
