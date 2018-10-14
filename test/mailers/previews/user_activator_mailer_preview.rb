class UserActivatorMailerPreview < ActionMailer::Preview
  def inform
    UserActivatorMailer.inform(User.first)
  end
end
