require 'rails_helper'

describe 'user index' do
  xit 'should show guest all users info' do
    VCR.use_cassette("all_users") do
      visit "/users"
    end

   expect(page).to have_content("Josiah Bartlet")
   expect(page).to have_content("jbartlet@example.com")
   expect(page).to have_content("Josh Lyman")
   expect(page).to have_content("jlyman@example.com")
  end
end
