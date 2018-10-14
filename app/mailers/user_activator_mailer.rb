class UserActivatorMailer < ApplicationMailer

  def inform(user)
    @user = user
    
    protocol = ActionMailer::Base.default_url_options[:protocol]
    base_url = ActionMailer::Base.default_url_options[:host]

    @url = "#{protocol}://#{base_url}/users/#{user.id}/activate"

    mail(to: @user.email, subject: "Activate Battleshift Account")
  end

end
