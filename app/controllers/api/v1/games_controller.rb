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
        game = Game.create(game_attributes)
        render json: game
      end

      private

        def player_1_board
          Board.new(4)
        end

        def player_2_board
          Board.new(4)
        end

        def player_2_key
          User.find_by_email(params[:opponent_email]).api_key
        end
        
        def game_attributes
          {
            player_1_board: player_1_board,
            player_2_board: player_2_board,
            player_1_turns: 0,
            player_2_turns: 0,
            current_turn: "player_1",
            player_1_api_key: request.headers["X-API-Key"],
            player_2_api_key: player_2_key
          }
        end

    end
  end
end
