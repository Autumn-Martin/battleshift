class UserFacade
  def initialize(id = nil)
    @id = id
  end

  def user_name
    user.name ## dream code

    # -----------
    UserServices.new("/api/v1/users/#{@id}").name
  end

  def user_email
    usergrab.email ## dream code

    # -----------
    UserServices.new("/api/v1/users/#{@id}").email
  end
  #
  # def user_grab
  #   services = UserServices.new("/api/v1/users/#{@id}")
  #   services.get_attributes
  #notes 
  # end

  #def users_grab
  #end

  private
    ### dream code ###
    def user
      @user ||= User.new(user_data)
    end

    def user_data
      @user_data ||= UserServices.new(@id).user_data
    end

end
