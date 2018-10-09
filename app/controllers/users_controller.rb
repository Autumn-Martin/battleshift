class UsersController < ApplicationController

  def show
    conn = Faraday.new(url: "http://localhost:3000/api/v1") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    user_id = params[:id]
    response = conn.get("users/#{user_id}")
    attributes = JSON.parse(response.body, symbolize_names: true)
    @user = User.new(attributes)
  end



end
