class TurnProcessor

  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
  end

  def run!
    begin
      # attack_opponent unless game.winner != nil
      attack_opponent
      # ai_attack_back
      #swap_player
      if game.current_turn == "player_1"
        game.current_turn = "player_2"
      elsif game.current_turn == "player_2"
        game.current_turn = "player_1"
      end
      game.save!
    rescue InvalidAttack => e
      @messages << e.message
    end

  end

  def message
    @messages.join(" ")
  end

  private

  attr_reader :game, :target

  def attack_opponent

    if opponent_board.valid_space?(target)
      result = Shooter.fire!(board: opponent_board, target: target)
      if result.include? ("sunk")
        opponent_board.damage
      end
      @messages << "Your shot resulted in a #{result}."
      game.player_1_turns += 1
      if opponent_board.board_health < 1
        @messages << "Game over."
        game[:winner] = current_player_email
        game.save!
      end

    else
      @messages << "Invalid coordinates"
    end
  end

  # def ai_attack_back
  #   result = AiSpaceSelector.new(player.board).fire!
  #   @messages << "The computer's shot resulted in a #{result}."
  #   game.player_2_turns += 1
  # end

  # def player
  #   game.current_player ||= Player.new(game.player_1_board)
  #
  # end

  def opponent_board
    if game.current_turn == "player_1"
      game.player_2_board
    elsif game.current_turn == "player_2"
      game.player_1_board
    end
  end

  def current_player_email
    if game.current_turn == "player_1"
      User.find_by(api_key: game.player_1_api_key).email
    elsif game.current_turn == "player_2"
      User.find_by(api_key: game.player_2_api_key).email
    end
  end


end
