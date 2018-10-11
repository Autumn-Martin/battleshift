module Api
  module V1
    class GamesController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound, with: :render_400

      def render_400
        render status: 400
      end

      def show
        game = Game.find(params[:id])
        render json: game
      end
    end
  end
end
