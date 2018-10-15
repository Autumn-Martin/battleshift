require 'rails_helper'

describe 'user activation' do
  it "should allow a user to activate" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit activation_path(user)

    expect(current_path).to eq(activation_path)
    fill_in  :user_api_key, with: user.api_key
    click_on "Submit"

    expect(user.activation).to eq("active")
    expect(current_path).to eq(dasboard_path)
  end
end
