class DisplayUser
  attr_reader :user_data
  def initialize(user_data = {})
    @user_data = user_data
    # @user = User.new(@user_data)
  end

  def user_name #refactor move to DisplayUser
    @user_data[:name]
  end

  def user_email #refactor move to DisplayUser
    @user_data[:email]
  end


end
