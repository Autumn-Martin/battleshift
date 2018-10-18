class AddPlayer1ApiKeyToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_1_api_key, :string
  end
end
