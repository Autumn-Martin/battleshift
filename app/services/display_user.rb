class DisplayUser
  def initialize(user_data)
    @user_data = user_data
  end

  def user_name #refactor move to DisplayUser
    user.name
  end

  def user_email #refactor move to DisplayUser
    user.email
  end


end
