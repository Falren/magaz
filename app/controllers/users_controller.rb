class UsersController < ApplicationController
  include Authorizable

  def show
    @user = User.find(params[:id])
    @drafted_order = current_user.drafted_order
    @completed_orders = current_user.completed_orders
  end

  def edit
    @user = User.find(params[:id])
    @user.build_address if @user.address.blank?
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user, bypass: true)
      redirect_to edit_user_path(@user), notice: 'Settings have been succesfully updated'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation,
      address_attributes: %i[id building_address post_index number]
    )
  end
end
