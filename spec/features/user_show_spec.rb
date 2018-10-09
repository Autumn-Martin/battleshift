require 'rails_helper'

describe 'user show' do
   it 'should show guest the user info' do

     # user = User.create!(name: "Josiah Bartlet", email: "jbartlet@example.com")
     # binding.pry

     visit "/users/1"
     expect(page).to have_content("Josiah Bartlet")
     expect(page).to have_content("jbartlet@example.com")
  end
end
