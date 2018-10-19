require 'rails_helper'

describe 'user update path' do
  let!(:user) { create(:user, email: "bat@z.com")}
  subject { user.update(email: "octo@i.com")}
  it 'should update a users email' do
    expect{subject}.to change{user.reload.email}.from("bat@z.com").to("octo@i.com")
  end
end
