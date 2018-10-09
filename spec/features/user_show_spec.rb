require 'rails_helper'

describe 'user show' do
   it 'should show user info' do

     user = User.create!(name: "Josiah Bartlet", email: "jbartlet@example.com")
     binding.pry

     visit "/users/#{user.id}"
     expect(page).to have_content("Josiah Bartlet")
     expect(page).to have_content("jbartlet@example.com")
  end
end
