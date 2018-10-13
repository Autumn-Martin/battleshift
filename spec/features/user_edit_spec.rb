require 'rails_helper'

describe 'user edit' do
   it 'should edit a users info' do
     VCR.use_cassette("before_edit_users") do
       visit "/users"
     end
     
    VCR.use_cassette("edit_user") do
      within(first(".user")) do
        click_on "Edit"
      end
    end

     expect(current_path).to eq("/users/1/edit")
     expect(page).to have_content("User email")
     expect(page).to have_button("Save")

     fill_in :user_email, with: "josiah@example.com"

     VCR.use_cassette("update_users") do
       click_on "Save"
     end

     # click_on "Save"

     expect(current_path).to eq("/users")
     expect(page).to have_content("Successfully updated Josiah Bartlet.")
     expect(page).to have_content("josiah@example.com")
  end
end
