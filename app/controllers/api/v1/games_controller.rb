module Api
  module V1
    class GamesController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound, with: :render_400
      # find returns ActiveRecord::RecordNotFound when the record passed in as parameter does not exist
      # rescue_from is a rails feature packaged in the ActiveSupport::Rescuable module
      def render_400
        render status: 400
      end

      def show
        game = Game.find(params[:id])
        render json: game
      end

      def create
        player_1_board = Board.new(4)
        player_2_board = Board.new(4)

        game_attributes = {
          player_1_board: player_1_board,
          player_2_board: player_2_board,
          player_1_turns: 0,
          player_2_turns: 0,
          current_turn: "player_1"
        }
        game = Game.create(game_attributes)

        render json: game

      end

    end
  end
end
