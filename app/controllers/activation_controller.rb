# class ActivationController < ApplicationController
#
#   def edit
#     # binding.pry
#     # @user = UserService.new(params[:id]).get_user
#     @user = User.find(params[:id]) # should also move to activation controller
#     # @user = UserService.new(params[:id]).update_user(params[:activation]) # move to activation_controller
#   end
#
#   def update
#     # binding.pry
#     # @user = UserService.new(params[:id]).update_user(params[:activation]) # move to activation_controller
#     @user = User.find(params[:id])
#     @user = User.update(user_params)
#     binding.pry
#     redirect_to dashboard_path
#   end
#
#   private
#
#   def user_params
#     params.require(:user).permit(:name, :email, :id, :password, :password_confirmation, :activation)
#   end
# end
