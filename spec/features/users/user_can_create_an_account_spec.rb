require 'rails_helper'

describe "User can create an account" do
  scenario "if they are not a current user" do

    visit '/'
    click_on("Signup")
    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Please Sign up")

    fill_in "user[name]", with: "Bob"
    fill_in "user[email]", with: "cl@etus"
    fill_in "user[password]", with: "centrelli"

    click_on("Create Account")

    expect(current_path).to eq user_path(User.last)
    expect(page).to have_content("Welcome Bob")
  expect(page).to have_content("Successful signup")


    click_on("Logout")
    expect(page).to have_content("Successfully logged out")
    expect(current_path).to eq('/')
  end

end
