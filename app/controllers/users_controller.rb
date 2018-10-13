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

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to dashboard_path
    flash["notice"] = "Logged in as #{@user.name}"
  end

  private
  def user_params
    params.permit(:name, :email, :id, :password, :password_confirmation)
  end

end
