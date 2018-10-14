require 'securerandom'
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
    if @user.save
      api_key = make_api_key
      @user.update(api_key: api_key) # update api key
      UserActivatorMailer.inform(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to dashboard_path

      flash["notice"] = "Logged in as #{@user.name}"
      flash["alert"] = "This account has not yet been activated. Please check your email"
    else
      flash.now.alert = "Please try again"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :id, :password, :password_confirmation)
  end

  def make_api_key
    SecureRandom.urlsafe_base64
  end

end
