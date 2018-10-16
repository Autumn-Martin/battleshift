class Api::V1::ShipsController < ApiController

  def create
    # binding.pry
    ship1 = Ship.new(2)
    ship2 = Ship.new(3)
    ships = [ship1, ship2]
    render json: ships
    # render json: Ship.new(3)

  end

  # private
  #
  #   def ship_params
  #     params.permit(:length, :damage, :start_space, :end_space)
  #   end
end
