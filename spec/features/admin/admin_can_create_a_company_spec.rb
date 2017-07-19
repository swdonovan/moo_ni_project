require 'rails_helper'

describe "Admin can create a company" do
  scenario "for company creation" do
    @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit 'admin/companies/new'


    fill_in "company[name]", with: "Cletus's Ranch"
    fill_in "company[city]", with: "Sweet Water"
    fill_in "company[state]", with: "Kentucky"
    click_on "Create"


    expect(current_path).to eq admin_company_path(Company.last)
    expect(page).to have_content("Cletus's Ranch")
  end

  describe "User can not create a company" do
    scenario "for company creation" do
      @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit 'admin/companies/new'



      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
