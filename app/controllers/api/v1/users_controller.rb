module Api
  module V1
    class UsersController < ApiController
      def index
        render json: User.all
      end

      def show
        render json: User.find(params[:id])
      end

      # def update
      #   # binding.pry
      #   user = User.find(params[:id])
      #   user.update(email: params[:user_email])
      # end
    end
  end
end
