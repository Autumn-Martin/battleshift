require 'rails_helper'

describe 'A guest user' do
  context 'should be able to update a users email' do
    subject { put api_v1_user_path(user), params: { email: "new email" } }
    context 'given a valid user with an email' do
      let!(:user) { create(:user, email: "test") }
      let!(:previous_email) { user.email }

      it 'updates user email' do
        expect{subject}.to change{user.reload.email}.from(previous_email).to("new email")
      end
    end
  end
end
