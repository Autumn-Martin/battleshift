module Api
  module V1
    module Games
      class ShotsController < ApiController
        before_action :find_game, :verify_turn
        def create
          # @game = Game.find(params[:game_id])
          # set_api_keys
          # binding.pry #request.headers["X-API-Key"] #game.attributes.keys #game.current_turn => player_1

            # if (request.headers["X-API-Key"] == @game[:player_1_api_key]) && (@game.current_turn == "player_1")
            # if (request.headers["X-API-Key"] == Figaro.env.BATTLESHIFT_OPPONENT_API_KEY) && (@game.current_turn == "player_1")

              turn_processor = TurnProcessor.new(@game, params[:shot][:target])

              turn_processor.run!

              if turn_processor.message == "Invalid coordinates"

                render json: @game, status: 400, message: turn_processor.message
                @game.current_turn = "player_1"
                turn_processor = TurnProcessor.new(@game, params[:shot][:target])
                turn_processor.run!
              else
                render json: @game, message: turn_processor.message
              end
            # elsif (request.headers["X-API-Key"] == @game[:player_2_api_key]) && (@game.current_turn == "player_2")
            #
            #     turn_processor = TurnProcessor.new(@game, params[:shot][:target])
            #
            #     turn_processor.run!
            #   if turn_processor.message == "Invalid coordinates"
            #     render json: @game, status: 400, message: turn_processor.message
            #     @game.current_turn = "player_2"
            #     turn_processor = TurnProcessor.new(@game, params[:shot][:target])
            #     turn_processor.run!
            #   else
            #     render json: @game, message: turn_processor.message
            #   end
            # else
            #   render status: 400, json: @game, message: "Invalid move. It's your opponent's turn"
              # @messages << "Invalid move. It's your opponent's turn"
              # render status: 400
            # elsif (request.headers["X-API-Key"] == @game[:player_1_api_key]) && (@game.current_turn != "player_1")
            #   render status: 400, json: @game, message: "Invalid move. It's your opponent's turn"

              # @messages << "Invalid move. It's your opponent's turn"
              # render status: 400
            # else
            #   render status: 400, json: @game, message: "Invalid move. It's your opponent's turn"
            # end
        end

        # def valid_players
        #   # if request.headers["X-API-Key"] == @game.[:player_1_api_key]
        #   if @game.current_turn == "player_1"
        #     @game[:player_1_api_key] = request.headers["X-API-Key"]
        #     return true
        #   elsif @game.current_turn == "player_2"
        #     @game[:player_2_api_key] = request.headers["X-API-Key"]
        #     return true
        #   else
        #     return false
        #   end
        # end
        private

        # def set_api_keys
        #   if @game[:player_1_api_key].nil?
        #     @game[:player_1_api_key] = request.headers["X-API-Key"]
        #   elsif @game[:player_2_api_key].nil? && request.headers["X-API-Key"] != @game[:player_1_api_key]
        #     @game[:player_2_api_key] = request.headers["X-API-Key"]
        #   end
        # end



      def verify_turn
        # binding.pry
        render json: @game, status: 400, message: "Invalid move. It's your opponent's turn" unless @game.current_turn == current_player
      end

      def find_game
        @game ||= Game.find(params[:game_id])
        # set_api_keys
      end

      def current_player
        if request.headers["X-API-Key"] == @game.player_1_api_key
          return "player_1"
        elsif request.headers["X-API-Key"] == @game.player_2_api_key
          return "player_2"
        end
      end


      end
    end
  end
end
