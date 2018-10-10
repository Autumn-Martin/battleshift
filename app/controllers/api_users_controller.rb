class ApiUsersController < ApplicationController

  def show
      # conn = Faraday.new(url: GetUrl.by_environment) do |faraday|
      #   faraday.adapter Faraday.default_adapter
      # end
      # user_id = params[:id]
      # response = conn.get("users/#{user_id}")
      #
      # attributes_hash = JSON.parse(response.body, symbolize_names: true)
      # @user = User.new(attributes_hash)

      user_attributes = get_attributes("users/#{user_id}")

      @user = User.new(user_attributes)

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
