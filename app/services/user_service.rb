class UserService
  def initialize(id = nil)
    @id = id
  end

  def get_user
    get_attributes(conn.get("/api/v1/users/#{@id}"))
  end

  def edit_user

    get_attributes(conn.patch("/api/v1/users/#{@id}"))
  end

  def get_users
    get_attributes(conn.get("/api/v1/users"))
  end

  private
    def conn
      Faraday.new(url: ENV["root_url"]) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_attributes(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
