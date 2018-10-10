class UserFacade
  def initialize(id = nil)
    @id = id
  end

  def user_name
    get_attributes("users/#{@id}")[:name]
  end

  def user_email
    get_attributes("users/#{@id}")[:email]
  end

  private
    def conn
      Faraday.new(url: GetUrl.by_environment) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_attributes(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end
end
