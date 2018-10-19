describe Board do
  describe 'it exists' do
    subject {Board.new(4)}
    it {is_expected.to be_a Board}
  end
  describe 'methods' do
    subject {Board.new(4)}

    it 'can be damaged' do
      subject.damage
      expect(subject.board_health).to eq(1)
    end
  end
end
