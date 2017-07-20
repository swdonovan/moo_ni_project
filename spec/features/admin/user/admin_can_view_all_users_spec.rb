require 'rails_helper'

describe "Admin can visit Users Index and See All" do
  scenario "users and sort through each user field" do
    @admin = create(:user).admin!

    user = create(:user)
    user_two = creat(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/users'

    expect(page).to have_content user.name
    expect(page).to have_content user_two.name
    #Need to figure out how to test a form tag so we can query sort
    expect(page).to have_link "Delete"
    expect(page).to have_link "Edit"

    click_link('Delete', match: :first)

    expect(current_path).to eq admin_companies_path
    expect(page).to have_content user_two.name
    expect(page).to have_link "Edit"

    click_link('Edit')

    expect(current_path).to eq edit_admin_user_path(user_two)
  end

  describe "User can not view index of companies" do
    # scenario "instead they are redirected to a statistics page about companies" do
    scenario "instead they are redirected to the error page" do
      @user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit 'admin/users'

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
