class UserActivatorMailer < ApplicationMailer

  def inform(user, user_contact)
    @user = user
    @url = "localhost.com/users/#{user.id}/activate"
    mail(to: user_contact, subject: "Activate Battleshift Account")
  end

end
