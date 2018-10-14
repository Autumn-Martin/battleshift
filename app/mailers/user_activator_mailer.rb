class UserActivatorMailer < ApplicationMailer

  def inform(user, user_contact)
    @user = user
    mail(to: user_contact, subject: "Activate Battleshift Account")
  end

end
