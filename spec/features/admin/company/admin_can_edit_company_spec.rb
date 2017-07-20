require 'rails_helper'

describe "Admin can edit a Company" do
  scenario "a user can edit a company" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    company_one = create(:company)
    company_two = create(:company)

    visit edit_admin_company_path(company_one)

    fill_in "company[name]", with: "EA Sports"
    fill_in "company[state]", with: "Montana"

    click_button "Update Company"

    expect(current_path).to eq admin_company_path(company_one)
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("#{company_one.state}")

    visit company_path(company_two)
  end

  describe "User can not edit a company" do
    scenario "for editting a company" do
      @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
      company_one = create(:company)
      company_two = create(:company)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit admin_companies_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
