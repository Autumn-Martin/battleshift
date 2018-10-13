require "rails_helper"

describe 'As a guest user' do
  it 'should be able to register a user' do
    visit "/"

    click_on "Register"

    expect(current_path).to eq("/register")

    fill_in :user_email, with: "toby@whitehouse.com"
    fill_in :user_name, with: "Toby"
    fill_in :user_password, with: "cats"
    fill_in :user_password_confirmation, with: "cats"
    
    click_on "Submit"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as Toby")
    expect(page).to have_content("This account has not yet been activated. Please check your email")
  end
end
