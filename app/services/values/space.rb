class Space
  attr_reader :coordinates, :status, :contents

  def initialize(coordinates)
    @coordinates = coordinates
    @contents    = nil
    @status      = "Not Attacked"
  end

  def attack!
    @status = if contents && not_attacked?
                contents.attack!
                if contents.is_sunk?
                  "Hit. Battleship sunk"
                  # elsif -- "Your shot resulted in a Hit. Battleship sunk. Game over."

                  # unless contents.damage == 10
                  #   "Game Over"
                  # end

                else
                  #@board.hit
                  "Hit"
                end
              else
                "Miss"
              end
  end

  def occupy!(ship)
    @contents = ship
  end

  def occupied?
    !!@contents
  end

  def not_attacked?
    status == "Not Attacked"
  end

end
