class UserActivatorMailer < ApplicationMailer

  def inform(user)
    @user = user
    @url = "localhost.com/users/#{user.id}/activate"
    mail(to: @user.email, subject: "Activate Battleshift Account")
  end

end
