class UserServices
  def initialize(id = nil)
    @id = id
  end

  # def name
  #   get_attributes[:name]
  # end
  #
  # def email
  #   get_attributes[:email]
  # end
  #delete these


  private
    def conn
      Faraday.new(url: ENV["root_url"]) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_attributes(response)
      JSON.parse(conn.get(response.body, symbolize_names: true)
    end
    #make unprivate
end
