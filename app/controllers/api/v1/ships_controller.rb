class Api::V1::ShipsController < ApiController

  def create
    @game = Game.find_by(id: params[:game_id])
    ship_1_placer.run
    ship_2_placer.run
    render json:  @game, message: messages(ship_1)
  end

  private

    def ship_params
      params.require(:ship).permit(:length, :damage, :start_space, :end_space, :ship_size)
    end

    def ship_1
      Ship.new(ship_params[:ship_size])
    end

    def ship_1_placer
      ship_1_info = {board: @game.player_1_board,
                     ship: ship_1,
                     start_space: ship_params[:start_space],
                     end_space: ship_params[:end_space]}

      ShipPlacer.new(ship_1_info)
    end

    def ship_2
      Ship.new(ship_params[:ship_size])
    end

    def ship_2_placer
      ship_2_info = {board: @game.player_2_board,
                    ship: ship_2,
                    start_space: ship_params[:start_space],
                    end_space: ship_params[:end_space]}
      ShipPlacer.new(ship_2_info)
    end

    def messages(ship)
      if ship.length == 3
        "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."
      else
        "Successfully placed ship with a size of 2. You have 0 ship(s) to place."
      end
    end
end
