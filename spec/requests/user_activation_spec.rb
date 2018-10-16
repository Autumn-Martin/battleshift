require 'rails_helper'

describe 'PATCH to user activation path' do
  subject { get activate_path(user), params: { key: user_api_key } }

  context 'given a valid user with an api key' do
    let!(:user) { create(:user) }
    let!(:user_api_key) { user.api_key }

    it 'activates user' do
      expect{subject}.to change{user.reload.activation}.from("inactive").to("active")
    end

    it 'redirects to the dashboard' do
      expect(subject).to redirect_to(dashboard_path)
    end
  end

  context 'given a valid user with an invalid api key' do
    let!(:user) { create(:user) }
    let!(:user_api_key) { 'invalid' }

    it 'does not activate user' do
      expect{subject}.to_not change{user.reload.activation}
    end

    it 'still redirects to dashboard' do
      expect(subject).to redirect_to(dashboard_path)
    end
  end
end
