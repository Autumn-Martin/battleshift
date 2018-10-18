class AddPlayer2ApiKeyToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_2_api_key, :string
  end
end
