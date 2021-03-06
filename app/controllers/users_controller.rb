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

  def activate
    @user = User.find(params[:id])
    if @user.api_key == params[:key]
      activate_key
    else
      flash["alert"] = "Sorry, wrong key."
      redirect_to dashboard_path
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      set_up_user
    else
      flash.now.alert = "Please try again"
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :id, :password, :password_confirmation)
    end

    def activate_key
      @user.update!(activation: "active")
      flash["alert"] = "Thank you! Your account is now activated."
      redirect_to dashboard_path
    end

    def set_up_user
      send_activation_email
      session[:user_id] = @user.id
      redirect_to dashboard_path
      alert_user
    end

    def send_activation_email
      @user.update(api_key: SecureRandom.urlsafe_base64)
      UserActivatorMailer.inform(@user).deliver_now
    end

    def alert_user
      flash["notice"] = "Logged in as #{@user.name}"
      flash["alert"] = "This account has not yet been activated. Please check your email"
    end

end
