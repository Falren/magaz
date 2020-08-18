class HomeController < ApplicationController
  def index
    @categories = Category.all
    @drafted_order = current_user.drafted_order if current_user
  end
end
