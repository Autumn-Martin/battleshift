class UserActivatorMailer < ApplicationMailer

  def inform(user)
    @user = user
    mail(to: @user, subject: "Activate Battleshift Account")
  end

end
