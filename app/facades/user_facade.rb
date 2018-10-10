class UserFacade
  def initialize(id = nil)
    @id = id
  end

  def user_name
    UserServices.new("users/#{@id}").name
  end

  def user_email
    UserServices.new("users/#{@id}").email
  end

end
