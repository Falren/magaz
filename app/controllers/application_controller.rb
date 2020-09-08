class ApplicationController < ActionController::Base
  add_flash_types :notice
  include Pundit
  protect_from_forgery
end
