class UserActivationController < ApplicationController
  def create
    UserActivatorMailer.inform(current_user, params[:email]).deliver_now
    flash[:notice] = "Successfully sent activation email."
    redirect_to root_url
  end
end
