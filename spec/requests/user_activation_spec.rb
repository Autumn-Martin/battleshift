require 'rails_helper'

describe 'User is activated' do
  it 'works' do
    user = create(:user)
    patch activate_path(user), params: { key: user.api_key }
    user.reload
    expect(user.activation).to eq("active")
  end
end
