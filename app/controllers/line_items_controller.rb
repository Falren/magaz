class LineItemsController < ApplicationController
  before_action :assign_draft_order, only: :create

  def create
    @line_item = LineItem.new(line_item_params)
    if @order.line_items << @line_item
      redirect_to edit_order_path(@line_item.order_id)
    else
      render 'new'
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to edit_order_path(@line_item.order_id)
  end

  private

  def assign_draft_order
    @order = Order.drafted.where(user_id: current_user.id).first_or_create
  end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
