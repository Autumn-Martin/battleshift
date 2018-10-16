class ApplicationController < ActionController::Base
  # include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  # protect_from_forgery unless: -> {  request.format.json? }
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
