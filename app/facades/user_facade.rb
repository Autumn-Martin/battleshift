class UserFacade
  def initialize(id = nil)
    @id = id
  end

  def find(id)
    user_data = UserService.new(id).get_user
    DisplayUser.new(user_data)
  end

  def all
    users.map do |user_data|
      DisplayUser.new(user_data)
    end
  end

  private
    def user
      @user ||= User.new(user_data)
    end

    def users
      @users ||= UserService.new.get_users
    end

    def user_data
      @user_data ||= UserService.new(@id).get_user
    end
end
