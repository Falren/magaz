class HomeController < ApplicationController
  def index
    @categories = Category.all
    @drafted_order = current_user.drafted_order.id if current_user
  end
end
