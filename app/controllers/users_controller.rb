class UsersController < ApplicationController

  def show
    @user_facade = UserFacade.new.find(params[:id])
  end

  def index
    @user_facade = UserFacade.new.all
  end

  def edit
    @user_to_edit = UserFacade.new.find(params[:id])
    # binding.pry
  end

  def update
    @user = UserFacade.new.find(params[:id])

    UserService.new(params[:id]).edit_user

    flash["alert"] = "Successfully updated Josiah Bartlet."

    redirect_to users_path
  end
end
