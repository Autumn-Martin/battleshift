require "rails_helper"

describe 'As a guest user' do
  it 'should be able to register a user' do
    visit "/"
    click_on "Register"
    # save_and_open_page
    expect(current_path).to eq("/register")
    fill_in :user_email, with: "toby@whitehouse.com"
    fill_in :user_name, with: "Toby"
    fill_in :user_password, with: "cats"
    fill_in :user_password_confirmation, with: "cats"
    click_on "Submit"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as Toby")
    expect(page).to have_content( )
  end
end
# As a guest user
# When I visit "/"
# And I click "Register"
# Then I should be on "/register"
# And when I fill in an email address (required)
# And I fill in name (required)
# And I fill in password and password confirmation (required)
# And I click submit
# Then I should be redirected to "/dashboard"
# And I should see a message that says "Logged in as <SOME_NAME>"
# And I should see "This account has not yet been activated. Please check your email."
