class LineItemsController < ApplicationController
  before_action :assign_draft_order, only: :create
  include Authorizable

  def create
    @line_item = LineItem.new(line_item_params)
    if @order.line_items << @line_item
      redirect_to edit_order_path(@line_item.order_id)
    else
      render 'products/show'
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to edit_order_path(@line_item.order_id)
  end

  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update(line_item_params)
      redirect_to edit_order_path(@line_item.order_id)
    else
      render 'product/show'
    end
  end

  private

  def assign_draft_order
    @order = Order.drafted.where(user_id: current_user.id).first_or_create
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
