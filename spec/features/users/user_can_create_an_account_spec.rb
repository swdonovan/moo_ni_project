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
    expect(current_path).to eq('/login')
  end

  scenario "must enter all fields as required for new account creation" do
    visit '/'
    click_on("Signup")
    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Please Sign up")


    fill_in "user[email]", with: "cl@etus"
    fill_in "user[password]", with: "centrelli"

    click_on("Create Account")

    expect(current_path).to eq('/users')
    expect(User.count).to eq(0)
    expect(page).to_not have_content("Successful signup")
  end

  scenario "must enter a unique email for account creation" do
    @user = User.create(name: "Homer", email:"donuts@springfield.com",
            password: "Duff")

    visit '/'
    click_on("Signup")
    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Please Sign up")

    fill_in "user[name]", with: "Bob"
    fill_in "user[email]", with: "donuts@springfield.com"
    fill_in "user[password]", with: "centrelli"

    click_on("Create Account")

    expect(current_path).to eq('/users')
    expect(User.count).to eq(1)
    expect(User.last.name).to eq("Homer")
    expect(page).to_not have_content("Successful signup")
  end

end
