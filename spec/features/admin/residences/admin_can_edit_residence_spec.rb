require 'rails_helper'

describe "Admin can edit a Residence" do
  scenario "a user can edit a specific residence information" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    residence_one = create(:residence)
    residence_two = create(:residence)

    visit edit_admin_residences_path(residence_one)

    fill_in "residence[name]", with: "Bulls"
    fill_in "residence[capacity]", with: 1

    click_button "Update Lot/Pasture"

    expect(current_path).to eq admin_residences_path(residence_one)
    expect(page).to have_content("Bulls")
    expect(page).to_not have_content("#{residence_one.capacity}")
  end

  describe "User can not edit a residence" do
    scenario "for editting a residence" do
      @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
      residence_one = create(:residence)
      residence_two = create(:residence)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit edit_admin_residence_path(residence_one)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
