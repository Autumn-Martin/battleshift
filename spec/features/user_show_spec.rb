require 'rails_helper'


# Title: Dogfooding GET /api/v1/users/:id

# Background: There is a user stored in the database with an id of 1, name of Josiah Bartlet, email of jbartlet@example.com
describe 'user show' do
   it 'should show user info' do
     visit "/users/1"
     expect(page).to have_content("Josiah Bartlet")
     expect(page).to have_content("jbartlet@example.com")
  end
end
