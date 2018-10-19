class TurnProcessor

  def initialize(game, target)
    @game   = game
    @target = target
    @messages = []
  end

  def run!
    begin
      attack_opponent
      switch_players
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

  def switch_players
    if game.current_turn == "player_1"
      game.current_turn = "player_2"
    elsif game.current_turn == "player_2"
      game.current_turn = "player_1"
    end
  end

  def attack_opponent
    if opponent_board.valid_space?(target)
      make_play
      game_over?
    else
      @messages << "Invalid coordinates"
    end
  end

  def make_play
    result = Shooter.fire!(board: opponent_board, target: target)
    acquire_points(result)
    @messages << "Your shot resulted in a #{result}."
    game.player_1_turns += 1
  end

  def acquire_points(result)
    if result.include? ("sunk")
      opponent_board.damage
    end
  end

  def game_over?
    if opponent_board.board_health < 1
      @messages << "Game over."
      game[:winner] = current_player_email
      game.save!
    end
  end

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
