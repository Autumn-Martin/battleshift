class UsersController < ApplicationController

  def show
    @user_facade = UserFacade.new.find(params[:id])
  end

  def index
    @user_facade = UserFacade.new.all
  end

  def edit
    @user_to_edit = UserFacade.new.find(params[:id])
  end

  def update
    @user = UserService.new(params[:id]).update_user(params[:user_email])

    redirect_to users_path
    flash["alert"] = "Successfully updated Josiah Bartlet."
  end

  private
  def user_params
    params.permit(:user_email, :id)
  end

end
