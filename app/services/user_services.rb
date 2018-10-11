class UserServices
  def initialize(id = nil)
    @id = id
  end

  def name
    get_attributes[:name]
  end

  def email
    get_attributes[:email]
  end

  def user_data
    get_attributes
  end
  
  private
    def conn
      Faraday.new(url: ENV["root_url"]) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_attributes
      JSON.parse(conn.get("/api/v1/users/#{@id}").body, symbolize_names: true)
    end
end
