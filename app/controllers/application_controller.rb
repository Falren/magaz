class ApplicationController < ActionController::Base
  add_flash_types :notice
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_admin

  private

  def user_not_admin
    flash[:notice] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
