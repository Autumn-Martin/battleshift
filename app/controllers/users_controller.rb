class UsersController < ApplicationController

  def show
    @user_facade = UserFacade.new(params[:id])
    # @user_facade = UserFacade.new.find(params[:id]) # refactor change to this
  end

  def index
    @user_facade = UserFacade.new.all # new for index 
  end

end
