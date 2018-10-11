class UserFacade
  def initialize(id = nil)
    @id = id
  end

  def user_name
    user.name
  end

  def user_email
    user.email
  end

  private
    def user
      @user ||= User.new(user_data)
    end

    def user_data
      @user_data ||= UserService.new(@id).get_user
    end
end
