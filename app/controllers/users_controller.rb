class UsersController < ApplicationController

  def show
      conn = Faraday.new(url: GetUrl.by_environment) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
      user_id = params[:id]
      response = conn.get("users/#{user_id}")

      attributes_hash = JSON.parse(response.body, symbolize_names: true)
      @user = User.new(attributes_hash)
  end

end
