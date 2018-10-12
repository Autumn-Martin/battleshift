require 'rails_helper'

describe 'user index' do
  it 'should show guest all users info' do
     # VCR.use_cassette("services/find_co_members") do
     #        members = PropublicaService.find_house_members("CO")
     #        member = members.first

    VCR.use_cassette("battle_shift_user_index") do
      users = UserService.new.get_users


      # visit "/users"
     expect(page).to have_content("Josiah Bartlet")
     expect(page).to have_content("jbartlet@example.com")
     expect(page).to have_content("Josh Lyman")
     expect(page).to have_content("jlyman@example.com")
    end
  end
end
