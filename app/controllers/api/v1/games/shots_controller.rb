module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          @game = Game.find(params[:game_id])
          # binding.pry #request.headers["X-API-Key"] #game.attributes.keys #game.current_turn => player_1
          # if request.headers["X-API-Key"] ==
          # binding.pry
          if valid_players
            turn_processor = TurnProcessor.new(@game, params[:shot][:target])

            turn_processor.run!
            # binding.pry

            render json: @game, message: turn_processor.message
          end
        end

        def valid_players
          # if request.headers["X-API-Key"] == @game.[:player_1_api_key]
          if @game.current_turn == "player_1"
            @game[:player_1_api_key] = request.headers["X-API-Key"]
            return true
          elsif @game.current_turn == "player_2"
            @game[:player_2_api_key] = request.headers["X-API-Key"]
            return true
          else
            return false
          end
        end


      end
    end
  end
end
