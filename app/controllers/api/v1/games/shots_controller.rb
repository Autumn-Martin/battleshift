class Api::V1::Games::ShotsController < ApiController
  before_action :find_game, :verify_players, :verify_turn, :check_for_win

  def create
    turn_processor = TurnProcessor.new(@game, params[:shot][:target])
    turn_processor.run!

    find_game

    if turn_processor.message == "Invalid coordinates"
      render json: @game, status: 400, message: turn_processor.message
      @game.current_turn = "player_1"
      turn_processor = TurnProcessor.new(@game, params[:shot][:target])
      turn_processor.run!
      find_game
    # elsif turn_processor.message
    #   render json: @game, status: 400, message: turn_processor.message
    else
      render json: @game, message: turn_processor.message
    end
  end

  private

    def verify_turn
      render json: @game, status: 400, message: "Invalid move. It's your opponent's turn" unless @game.current_turn == current_player
    end

    def find_game
      @game = Game.find(params[:game_id])
    end

    def current_player
      if request.headers["X-API-Key"] == @game.player_1_api_key
        "player_1"
      elsif request.headers["X-API-Key"] == @game.player_2_api_key
        "player_2"
      end
    end

    def check_for_win
      if @game.winner
        # "Invalid move. Game over."
        # binding.pry
        render json: @game, status: 400, message: "Invalid move. Game over."
      end
    end

    def verify_players
      unless request.headers["X-API-Key"] == @game.player_1_api_key || request.headers["X-API-Key"] == @game.player_2_api_key
        render json: @game, status: 401, message: "Unauthorized"
      end
    end

end
