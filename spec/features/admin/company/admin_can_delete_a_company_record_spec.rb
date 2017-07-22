require 'rails_helper'

describe "Admin can delete a Company" do
  scenario "from it's records" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    company_one = create(:company)
    company_two = create(:company)

    expect(Company.count).to eq(2)

    visit admin_company_path(company_one)
    click_link("Delete")

    expect(current_path).to eq(admin_companies_path)
    expect(Company.count).to eq(1)
  end

  describe "User can not delete a company" do
    scenario "from admin's records" do
      @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
      company_one = create(:company)
      company_two = create(:company)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit admin_company_path(company_one)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
