class UserFacade
  def initialize(id = nil)
    @id = id
  end

  def user_name
    # user.name ## dream code

    # -----------
    UserServices.new("/api/v1/users/#{@id}").name
  end

  def user_email
    # user.email ## dream code

    # -----------
    UserServices.new("/api/v1/users/#{@id}").email
  end

  private
    ### dream code ###
    # def user
    #   @user ||= User.new(user_data)
    # end
    #
    # def user_data
    #   @user_data ||= UserServices.new(@id).user_data
    # end

end
