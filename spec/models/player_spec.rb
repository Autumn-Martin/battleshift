describe Player do
  let! (:player_1_board) { Board.new(4)}
  subject { Player.new(player_1_board) }
  
  it { is_expected.to be_a Player}
end
