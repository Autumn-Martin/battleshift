class UserService
  def initialize(id = nil)
    @id = id
  end

  def get_user
    get_attributes(conn.get("/api/v1/users/#{@id}"))
  end

  def update_user(email)
    # binding.pry

    conn.patch("/api/v1/users/#{@id}", email: email)
    # user = User.create(user_params)
    # user.update(email: :user_email)
  end

  def get_users
    get_attributes(conn.get("/api/v1/users"))
  end

  private
    def conn
      Faraday.new(url: ENV["root_url"])
    end

    def get_attributes(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
