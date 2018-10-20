require 'rails_helper'

describe "Api::V1::ShipsController" do
  context "POST /api/v1/games/:id/ships" do
  let(:player_1) { create(:user) }
  let(:player_2) { create(:user, name: "Ray") }
  let(:game) { create(:game, player_1_board: Board.new(4), player_2_board: Board.new(4)) }

    it "can place the first ship on the board" do
      player_1.update(api_key: "111")
      player_1_api_key = player_1.api_key

      headers = { "CONTENT-TYPE": "application/json", "X-API-Key": player_1_api_key }
      ship_1_data =  { ship_size: 3,
                       start_space: "A1",
                       end_space: "A3"
                      }.to_json

      post "/api/v1/games/#{game.id}/ships", params: ship_1_data, headers: headers

      game = JSON.parse(response.body, symbolize_names: true)
      expected_message = "Successfully placed ship with a size of 3. You have 1 ship(s) to place with a size of 2."

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(game[:message]).to eq(expected_message)
    end

    it "can place ships the second ship on the board" do
      player_1.update(api_key: "111")
      player_1_api_key = player_1.api_key

      headers = { "CONTENT-TYPE": "application/json", "X-API-Key": player_1_api_key }
      ship_2_data =  { ship_size: 2,
                          start_space: "B1",
                          end_space: "C1"
                        }.to_json

      post "/api/v1/games/#{game.id}/ships", params: ship_2_data, headers: headers

      game = JSON.parse(response.body, symbolize_names: true)
      expected_message = "Successfully placed ship with a size of 2. You have 0 ship(s) to place."

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(game[:message]).to eq(expected_message)
    end
  end
end
