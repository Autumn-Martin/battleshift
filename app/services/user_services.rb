class UserServices
  def initialize(uri)
    @uri = uri
  end

  def name
    get_attributes(@uri)[:name]
  end

  def email
    get_attributes(@uri)[:email]
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
