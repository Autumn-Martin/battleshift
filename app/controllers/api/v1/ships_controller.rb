class Api::V1::ShipsController < ApiController

  def create
    game = Game.find_by(id: params[:game_id])
    ship = Ship.new(ship_params)
    render json:  game
  end

  private

    def ship_params
      params.require(:ship).permit(:length, :damage, :start_space, :end_space, :ship_size)
    end
end
