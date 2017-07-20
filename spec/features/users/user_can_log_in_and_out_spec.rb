require 'rails_helper'

describe "User can log in and out of a session" do
  scenario "if they are a current user" do
    @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    visit '/'
    click_on("Login")
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please sign in")

    fill_in "session[email]", with: "cl@etus"
    fill_in "session[password]", with: "centrelli"
    click_on("Sign in")

    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome Cletus")
    expect(page).to have_content("Login Successful")


    click_on("Logout")
    expect(page).to have_content("Successfully logged out")
    expect(current_path).to eq('/login')
  end

end
