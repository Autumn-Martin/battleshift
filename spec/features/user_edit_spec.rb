# Title: Build PATCH /api/v1/users/:id
#
# API should only support changing a users's email address
# Title: Edit a user's email address (dogfooding PATCH /api/v1/users/:id)
#
# Background: There is a user stored in the database with an id of 1, name of Josiah Bartlet, email of jbartlet@example.com
#
# As a guest user
# When I visit "/users"
# And I click on `Edit` for Josiah Bartlet
# Then I should be on "/users/1/edit"
#
# When I fill in the email field with "josiah@example.com"
# And I click "Save"
# Then I should be on "/users"
# And I should see a flash message that says "Successfully updated Josiah Bartlet."
# And I should should see Josiah Bartlet's email show up in the list as "josiah@example.com"

require 'rails_helper'

describe 'user edit' do
   it 'should edit a users info' do

     visit "/users"
     within(first(".user")) do
       click_on "Edit"
     end 

     expect(current_path).to eq("/users/1/edit")
     expect(page).to have_content("Josiah Bartlet")
     expect(page).to have_content("jbartlet@example.com")
     expect(page).to have_content("Josh Lyman")
     expect(page).to have_content("jlyman@example.com")
  end
end
