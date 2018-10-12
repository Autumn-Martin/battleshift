class UsersController < ApplicationController

  def show
    @user_facade = UserFacade.new.find(params[:id])
  end

  def index
    @user_facade = UserFacade.new.all
  end

  def edit

  end

  def update
    flash["alert"] = "Successfully updated Josiah Bartlet."
    redirect_to users_path
  end
end
