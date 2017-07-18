require 'rails_helper'

describe "Admin can create a company" do
  scenario "for company creation" do
    visit 'admin/companies/new'

    fill_in "company[name]", with: "Cletus's Ranch"
    fill_in "company[city]", with: "Sweet Water"
    fill_in "company[state]", with: "Kentucky"
    click_on "Create"

    expect(current_path).to eq admin_company(Company.last)
    expect(page).to have_content("Cletus's Ranch")
  end
end
