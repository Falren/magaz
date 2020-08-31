class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @completed_orders = current_user.completed_orders
    @products = Product.all
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
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
    @line_items = @order.line_items
    @order.build_address if @order.address.blank?
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path
    else
      flash.keep[:notice] = 'You must fills the fields with an asterisk'
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
    params.require(:order).permit(
      :user_id, :note, :status,
      line_items_attributes: %i[quantity id],
      address_attributes: %i[id building_address post_index number]
    )
  end
end
