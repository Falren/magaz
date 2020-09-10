class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @categories = Category.all
    @drafted_order = current_user&.drafted_order
  end
end
