class UserFacade
  def initialize(id = nil)
    @id = id
  end

  def user_name
    binding.pry
    user_attributes = get_attributes("users/#{@id}")[:name]

    # @user = User.new(user_attributes)
  end

  def user_email
    user_attributes = get_attributes("users/#{@id}")[:email]

    # @user = User.new(user_attributes)
  end



  private
    def conn
      Faraday.new(url: GetUrl.by_environment) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def user_id
      params[:id]
    end

    def get_attributes(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end
end
