class ActivationController < ApplicationController
  def update
    # binding.pry
    @user = UserService.new(params[:id]).update_user(params[:activation]) # move to activation_controller
    redirect_to dashboard_path
  end
end
