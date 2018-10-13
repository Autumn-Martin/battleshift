require 'rails_helper'

describe 'user show' do
   it 'should show guest the user info' do

     VCR.use_cassette("single_user") do
       visit "/users/1"
     end

     expect(page).to have_content("Josiah Bartlet")
     expect(page).to have_content("jbartlet@example.com")
  end
end
