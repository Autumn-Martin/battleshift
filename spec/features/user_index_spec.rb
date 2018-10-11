require 'rails_helper'

describe 'user index' do
   it 'should show guest all users info' do

     # user = User.create!(name: "Josiah Bartlet", email: "jbartlet@example.com")
     # binding.pry
     user = User.new(name: "Han Solo", email: "hansolo@email.com")

     visit "/users"
     expect(page).to have_content("Josiah Bartlet")
     expect(page).to have_content("jbartlet@example.com")
  end
end
