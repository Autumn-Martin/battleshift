class UserActivatorMailerPreview < ActionMailer::Preview
  def inform
    user = User.create!(name: 'user', email: 'test@mail.com', password: 'pass', password_confirmation: 'pass')
    UserActivatorMailer.inform(user)
  end
end
