require 'rails_helper'

describe "Admin can edit a Residence" do
  scenario "a user can edit a specific residence information" do
    @admin = User.create(name: "Cletus", email: "cl@etus", password: "centrelli",
                        role: 1)

    residence_one = create(:residence)
    residence_two = create(:residence)



    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    expect(residence_one.name).to eq("Billy Joe")
    expect(residence_one.max_capacity).to eq(1)

    visit edit_admin_residence_path(Residence.first)

    # save_and_open_page
    fill_in "residence[name]", with: "Bulls"
    fill_in "residence[max_capacity]", with: 11

    click_button "Update"

    expect(current_path).to eq admin_residence_path(residence_one)
    expect(page).to have_content("Bulls")
    expect(page).to have_content(11)
    expect(Residence.first.name).to eq("Bulls")
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
