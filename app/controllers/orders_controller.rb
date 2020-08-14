class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @products = Product.all
  end

  def show
    @order = Order.find(params[:id])
    @products = Product.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path(@order)
    else
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.upadte(order_params)
      redirect_to order_path(@order)
    else
      render 'edit'
    end
  end

  def destroy
    @order = order.find(params[:id])
    if @order.destroy
      redirect_to orders_path
    else
      render 'show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :note)
  end
end
