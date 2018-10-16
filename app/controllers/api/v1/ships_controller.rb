class Api::V1::ShipsController < ApiController

  def create
    # binding.pry
    render json: Ship.new(ship_params)
  end

  private

    def ship_params
      params.permit(:length, :damage, :start_space, :end_space)
    end
end
