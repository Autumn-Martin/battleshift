class Api::V1::ShipsController < ApiController

  def create
    game = Game.find_by(id: params[:game_id])
    ship_1 = Ship.new(ship_params[:ship_size])
    ship_1_info = {board: game.player_1_board,
                   ship: ship_1,
                   start_space: ship_params[:start_space],
                   end_space: ship_params[:end_space]}

    ship_1_placer = ShipPlacer.new(ship_1_info)
    ship_1_placer.run

    ship_2 = Ship.new(ship_params[:ship_size])
    ship_2_info = {board: game.player_2_board,
                   ship: ship_2,
                   start_space: ship_params[:start_space],
                   end_space: ship_params[:end_space]}

    ship_2_placer = ShipPlacer.new(ship_2_info)
    # binding.pry
    ship_2_placer.run

    render json:  game, message: "Successfully placed ship with a size of #{ship_1.length}. You have 1 ship(s) to place with a size of #{ship_1.length-1}."
  end

  private

    def ship_params
      params.require(:ship).permit(:length, :damage, :start_space, :end_space, :ship_size)
    end
end
