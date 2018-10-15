require 'rails_helper'

describe 'user activation' do
  it "should allow a user to activate" do
    user = create(:user, activation: "inactive")
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit activate_path(user)
    expect(current_path).to eq(activate_path(user))
    fill_in  :api_key, with: user.api_key
    click_on "Save changes"

    expect(user.activation).to eq("active")
    expect(current_path).to eq(dasboard_path)
  end
end
