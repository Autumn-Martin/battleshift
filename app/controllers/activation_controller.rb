class ActivationController < ApplicationController

  def edit
    @user = UserService.new(params[:id]).get_user # should also move to activation controller
    # @user = UserService.new(params[:id]).update_user(params[:activation]) # move to activation_controller
  end

  def update
    # binding.pry
    @user = UserService.new(params[:id]).update_user(params[:activation]) # move to activation_controller
    redirect_to dashboard_path
  end
end
