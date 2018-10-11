class DisplayUser
  attr_reader :user_data
  def initialize(user_data = {})
    @user_data = user_data
  end

  def user_name
    @user_data[:name]
  end

  def user_email 
    @user_data[:email]
  end


end
