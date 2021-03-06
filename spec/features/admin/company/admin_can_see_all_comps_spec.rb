require 'rails_helper'

describe "Admin can visit Companies Index and See All" do
  scenario "for admin to see all companies" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    company = create(:company)
    company_two = create(:company)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/companies'

    expect(page).to have_content company.name
    expect(page).to have_content company_two.name
  end

  describe "User can not view index of companies" do
    # scenario "instead they are redirected to a statistics page about companies" do
    scenario "instead they are redirected to the error page" do
      @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit 'admin/companies'

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
