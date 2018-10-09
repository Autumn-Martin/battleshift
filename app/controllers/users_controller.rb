class UsersController < ApplicationController

  def show
      conn = Faraday.new(url: "http://localhost:3000/api/v1") do |faraday| #change to GetUrl.by_environment later
        faraday.adapter Faraday.default_adapter
      end
      user_id = params[:id]
      response = conn.get("users/#{user_id}")

      attributes_hash = JSON.parse(response.body, symbolize_names: true)
      @user = User.new(attributes_hash)
  end

end
