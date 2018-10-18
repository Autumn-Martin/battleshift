class Api::V1::Games::ShotsController < ApiController
  before_action :find_game, :verify_turn

  def create
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
  end

  private

    def verify_turn
      render json: @game, status: 400, message: "Invalid move. It's your opponent's turn" unless @game.current_turn == current_player
    end

    def find_game
      @game ||= Game.find(params[:game_id])
    end

    def current_player
      if request.headers["X-API-Key"] == @game.player_1_api_key
        "player_1"
      elsif request.headers["X-API-Key"] == @game.player_2_api_key
        "player_2"
      end
    end

end
