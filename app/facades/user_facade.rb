class UserFacade
  def initialize(id = nil) #refactor remove
    @id = id
  end

  def find(id)  #refactor include
    user_data = UserService.new(id).get_user
    DisplayUser.new(user_data)
  end

  # def user_name #refactor move to DisplayUser
  #   user.name
  # end
  #
  # def user_email #refactor move to DisplayUser
  #   user.email
  # end

  def all
    users.map do |user_data| #refactor include
      DisplayUser.new(user_data)
    end
  end

  private
    def user
      @user ||= User.new(user_data)
    end

    def users # refactor include
      @users ||= UserService.new.get_users
    end

    def user_data
      @user_data ||= UserService.new(@id).get_user
    end
end
