require 'rails_helper'

describe "Admin can create a residence/lot/pasture" do
  scenario "for residence creation" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit 'admin/companies/new'


    fill_in "residence[name]", with: "Cletus's Ranch"
    fill_in "residence[capacity]", with: 150

    click_on "Create Pasture/Lot"


    expect(current_path).to eq admin_residence_path(Residence.last)
    expect(page).to have_content("Cletus's Ranch")
    expect(page).to have_content("Capacity: 150")
    expect(page).to have_link("Delete")
    expect(page).to have_link("Edit")

    click_link "Edit"

    expect(current_path).to eq edit_residence_path(Residence.last)
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
